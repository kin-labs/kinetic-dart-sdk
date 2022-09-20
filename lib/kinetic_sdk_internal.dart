import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/helpers/generate_create_account_transaction.dart';
import 'package:kinetic/interfaces/create_account_options.dart';
import 'package:kinetic/interfaces/generate_make_transfer_options.dart';
import 'package:kinetic/interfaces/get_token_accounts_options.dart';
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

  Future<AppConfig?> getAppConfig(KineticSdkConfig sdkConfig) async {
    AppConfig? config = await appApi.getAppConfig(sdkConfig.environment.environment, sdkConfig.index);
    if ( config != null) {
      appConfig = config;
    }
    return config;
  }

  Future<BalanceResponse?> getBalance(KineticSdkConfig sdkConfig, String accountId) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    BalanceResponse? res = await accountApi.getBalance(sdkConfig.environment.environment, sdkConfig.index, accountId);
    return res;
  }

  Future<List<HistoryResponse>?> getHistory(KineticSdkConfig sdkConfig, String accountId, String mint) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    List<HistoryResponse>? res = await accountApi.getHistory(sdkConfig.environment.environment, sdkConfig.index, accountId, mint);
    return res;
  }

  Future<RequestAirdropResponse?> postRequestAirdrop(RequestAirdropRequest airdropRequest) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    RequestAirdropResponse? res = await airdropApi.requestAirdrop(airdropRequest);
    return res;
  }

  Future<Transaction?> makeTransfer(MakeTransferOptions makeTransferOptions) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    Map<String, dynamic> res = await prepareTransaction(makeTransferOptions.mint);

    List<String>? senderATA = await getTokenAccounts(GetTokenAccountsOptions(account: makeTransferOptions.owner.publicKey, mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint)));
    List<String>? receiverATA = await getTokenAccounts(GetTokenAccountsOptions(account: makeTransferOptions.destination, mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint)));

    if ((senderATA == null || senderATA.isEmpty)) {
      throw NoAssociatedTokenAccountException(makeTransferOptions.owner.publicKey.toBase58(), makeTransferOptions.mint);
    }

    if ((receiverATA == null || receiverATA.isEmpty) && makeTransferOptions.senderCreate == false) {
      throw NoAssociatedTokenAccountException(makeTransferOptions.destination.toBase58(), makeTransferOptions.mint);
    }

    GenerateMakeTransferOptions options = GenerateMakeTransferOptions(addMemo: appConfig?.mint.addMemo ?? true, amount: makeTransferOptions.amount, appIndex: sdkConfig.index, destination: makeTransferOptions.destination, lastValidBlockHeight: res["lastValidBlockHeight"], latestBlockhash: res["latestBlockhash"], mintDecimals: res["mintDecimals"], mintFeePayer: res["mintFeePayer"], mintPublicKey: res["mintPublicKey"], signer: makeTransferOptions.owner, senderATA: senderATA[0], senderCreate: (receiverATA == null || receiverATA.isEmpty) && makeTransferOptions.senderCreate, type: makeTransferOptions.type);

    String tx = await generateMakeTransferTransaction(options);

    final makeTransferRequest = MakeTransferRequest(
      commitment: makeTransferOptions.commitment,
      lastValidBlockHeight: options.lastValidBlockHeight,
      environment: sdkConfig.environment.environment,
      index: options.appIndex,
      mint: makeTransferOptions.mint,
      referenceId: makeTransferOptions.referenceId,
      referenceType: makeTransferOptions.referenceType,
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

    List<String>? result = await accountApi.getTokenAccounts(sdkConfig.environment.environment, sdkConfig.index, options.account.toBase58(), options.mint.toBase58());

    return result;
  }

  Future<Transaction?> createAccount(CreateAccountOptions createAccountOptions) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    Map<String, dynamic> res = await prepareTransaction(createAccountOptions.mint);
    String tx = await generateCreateAccountTransaction(sdkConfig.index, res["latestBlockhash"], res["mintPublicKey"], createAccountOptions.owner, res["mintFeePayer"]);

    final createAccountRequest = CreateAccountRequest(
      environment: sdkConfig.environment.environment,
      index: sdkConfig.index,
      mint: createAccountOptions.mint,
      referenceId: createAccountOptions.referenceId,
      referenceType: createAccountOptions.referenceType,
      tx: tx,
      commitment: createAccountOptions.commitment,
      lastValidBlockHeight: res["lastValidBlockHeight"],
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

  Future<Map<String, dynamic>> prepareTransaction(String mint) async {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    // getFeePayer also performs a mint check
    String mintFeePayer = getFeePayer(appConfig, mint);
    int mintDecimals = getDecimals(appConfig, mint);

    LatestBlockhashResponse? latestBlockhashResponse = await transactionApi.getLatestBlockhash(sdkConfig.environment.environment, sdkConfig.index);

    String latestBlockhash = latestBlockhashResponse?.blockhash ?? "";
    int lastValidBlockHeight = latestBlockhashResponse?.lastValidBlockHeight ?? 0;

    return {
      "mintFeePayer":mintFeePayer,
      "mintDecimals":mintDecimals,
      "mintPublicKey":mint,
      "latestBlockhash":latestBlockhash,
      "lastValidBlockHeight":lastValidBlockHeight,
    };
  }

}

