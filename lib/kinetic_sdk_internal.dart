import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/helpers/generate_create_account_transaction.dart';
import 'package:kinetic/interfaces/create_account_options.dart';
import 'package:kinetic/interfaces/generate_make_transfer_options.dart';
import 'package:kinetic/interfaces/get_history_options.dart';
import 'package:kinetic/interfaces/get_token_accounts_options.dart';
import 'package:kinetic/interfaces/request_airdrop_options.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/solana.dart';

import 'exceptions.dart';
import 'helpers/generate_make_transfer_transaction.dart';
import 'interfaces/kinetic_sdk_config.dart';
import 'interfaces/make_transfer_options.dart';

class KineticSdkInternal {
  final KineticSdkConfig sdkConfig;

  late ApiClient apiConfig;
  late AppApi appApi;
  late AccountApi accountApi;
  late AirdropApi airdropApi;
  late TransactionApi transactionApi;

  AppConfig? appConfig;

  KineticSdkInternal(this.sdkConfig) {
    // Create the API Configuration
    apiConfig = ApiClient(basePath: sdkConfig.endpoint);

    // Configure the APIs
    accountApi = AccountApi(apiConfig);
    airdropApi = AirdropApi(apiConfig);
    appApi = AppApi(apiConfig);
    transactionApi = TransactionApi(apiConfig);
  }

  Future<AppConfig?> getAppConfig(String environment, int index) async {
    appConfig = await appApi.getAppConfig(environment, index);
    if (appConfig == null) {
      throw Exception("Unable to get app config");
    }
    return appConfig;
  }

  Future<BalanceResponse?> getBalance(String accountId) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    return accountApi.getBalance(sdkConfig.environment, sdkConfig.index, accountId);
  }

  Future<List<HistoryResponse>?> getHistory(GetHistoryOptions options) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    String? mint = _ensureMint(options.mint);

    return accountApi.getHistory(sdkConfig.environment, sdkConfig.index, options.account, mint);
  }

  Future<RequestAirdropResponse?> requestAirdrop(RequestAirdropOptions options) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    String? mint = _ensureMint(options.mint);

    return airdropApi.requestAirdrop(RequestAirdropRequest(
      account: options.account,
      amount: options.amount,
      commitment: options.commitment as RequestAirdropRequestCommitmentEnum,
      environment: appConfig?.environment.name as String,
      index: appConfig?.app.index as int,
      mint: mint,
    ));
  }

  Future<Transaction?> makeTransfer(MakeTransferOptions options) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    if (appConfig == null) {
      throw KineticInitializationException();
    }

    String? mint = _ensureMint(options.mint);

    PrepareTransactionResponse res = await prepareTransaction(mint: mint);

    List<String>? accounts = await getTokenAccounts(GetTokenAccountsOptions(
      account: options.destination,
      mint: mint,
    ));

    // throw error of accounts length is smaller than one
    if (accounts == null || accounts.isEmpty) {
      throw NoAssociatedTokenAccountException(options.destination, mint);
    }

    List<String>? ownerTokenAccount =
        await getTokenAccounts(GetTokenAccountsOptions(account: options.owner.publicKey.toString(), mint: mint));

    if ((ownerTokenAccount == null || ownerTokenAccount.isEmpty)) {
      throw NoAssociatedTokenAccountException(options.owner.publicKey.toBase58(), mint);
    }

    // List<String>? receiverATA = await getTokenAccounts(GetTokenAccountsOptions(account: options.destination, mint: mint));
    // if ((receiverATA == null || receiverATA.isEmpty) && options.senderCreate == false) {
    //   throw NoAssociatedTokenAccountException(options.destination, mint);
    // }

    GenerateMakeTransferOptions req = GenerateMakeTransferOptions(
      addMemo: appConfig?.mint.addMemo ?? true,
      amount: options.amount,
      appIndex: sdkConfig.index,
      destination: options.destination,
      lastValidBlockHeight: res.lastValidBlockHeight,
      latestBlockhash: res.latestBlockhash,
      mintDecimals: res.mintDecimals,
      mintFeePayer: res.mintFeePayer,
      mintPublicKey: res.mintPublicKey,
      ownerTokenAccount: ownerTokenAccount.first,
      signer: options.owner,
      senderCreate: options.senderCreate,
      type: options.type as TransactionType,
    );

    String tx = await generateMakeTransferTransaction(req);

    final makeTransferRequest = MakeTransferRequest(
      commitment: options.commitment as MakeTransferRequestCommitmentEnum,
      environment: sdkConfig.environment,
      index: appConfig?.app.index as int,
      lastValidBlockHeight: res.lastValidBlockHeight,
      mint: mint,
      referenceId: options.referenceId,
      referenceType: options.referenceType,
      tx: tx,
    );

    Transaction? transaction;
    try {
      transaction = await transactionApi.makeTransfer(makeTransferRequest);
      safePrint(transaction);
    } catch (e) {
      safePrint('Exception when calling TransactionApi->makeTransfer: $e\n');
    }

    return transaction;
  }

  Future<List<String>?> getTokenAccounts(GetTokenAccountsOptions options) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    List<String>? result = await accountApi.getTokenAccounts(
      sdkConfig.environment,
      sdkConfig.index,
      options.account,
      options.mint,
    );

    return result;
  }

  Future<Transaction?> createAccount(CreateAccountOptions options) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    String? mint = _ensureMint(options.mint);

    PrepareTransactionResponse res = await prepareTransaction(mint: mint);

    String tx = await generateCreateAccountTransaction(
        sdkConfig.index, res.latestBlockhash, res.mintPublicKey, options.owner, res.mintFeePayer);

    final createAccountRequest = CreateAccountRequest(
      environment: sdkConfig.environment,
      index: sdkConfig.index,
      mint: mint,
      referenceId: options.referenceId,
      referenceType: options.referenceType,
      tx: tx,
      commitment: options.commitment?.toString() as CreateAccountRequestCommitmentEnum,
      lastValidBlockHeight: res.lastValidBlockHeight,
    );

    Transaction? transaction;
    try {
      transaction = await accountApi.createAccount(createAccountRequest);
      safePrint(transaction);
    } catch (e) {
      safePrint('Exception when calling AccountApi->createAccount: $e\n');
    }

    return transaction;
  }

  Future<PrepareTransactionResponse> prepareTransaction({required String mint}) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    // getFeePayer also performs a mint check
    String mintFeePayer = getFeePayer(appConfig, mint);
    int mintDecimals = getDecimals(appConfig, mint);

    LatestBlockhashResponse? latestBlockhashResponse =
        await transactionApi.getLatestBlockhash(sdkConfig.environment, sdkConfig.index);

    String latestBlockhash = latestBlockhashResponse?.blockhash ?? "";
    int lastValidBlockHeight = latestBlockhashResponse?.lastValidBlockHeight ?? 0;

    return PrepareTransactionResponse(
      mintFeePayer: mintFeePayer,
      mintDecimals: mintDecimals,
      mintPublicKey: mint,
      latestBlockhash: latestBlockhash,
      lastValidBlockHeight: lastValidBlockHeight,
    );
  }

  String _ensureMint(String? mint) {
    mint = mint ?? appConfig?.mint.publicKey;
    if (mint == null) {
      throw KineticMissingMintsException();
    }
    return mint;
  }
}

class PrepareTransactionResponse {
  final String mintFeePayer;
  final int mintDecimals;
  final String mintPublicKey;
  final String latestBlockhash;
  final int lastValidBlockHeight;
  PrepareTransactionResponse(
      {required this.mintFeePayer,
      required this.mintDecimals,
      required this.mintPublicKey,
      required this.latestBlockhash,
      required this.lastValidBlockHeight});
}
