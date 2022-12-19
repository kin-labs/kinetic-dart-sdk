import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/helpers/generate_create_account_transaction.dart';
import 'package:kinetic/interfaces/close_account_options.dart';
import 'package:kinetic/interfaces/create_account_options.dart';
import 'package:kinetic/interfaces/generate_create_account_options.dart';
import 'package:kinetic/interfaces/generate_make_transfer_options.dart';
import 'package:kinetic/interfaces/get_account_info_options.dart';
import 'package:kinetic/interfaces/get_balance_options.dart';
import 'package:kinetic/interfaces/get_history_options.dart';
import 'package:kinetic/interfaces/get_token_accounts_options.dart';
import 'package:kinetic/interfaces/get_transaction_options.dart';
import 'package:kinetic/interfaces/request_airdrop_options.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:solana/encoder.dart';

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
    sdkConfig.headers?.forEach((key, value) => apiConfig.addDefaultHeader(key, value));

    // Configure the APIs
    accountApi = AccountApi(apiConfig);
    airdropApi = AirdropApi(apiConfig);
    appApi = AppApi(apiConfig);
    transactionApi = TransactionApi(apiConfig);
  }

  Future<Transaction?> closeAccount(CloseAccountOptions options) async {
    var appConfig = _ensureAppConfig();
    Commitment commitment = _getCommitment(options.commitment);
    AppConfigMint? mint = _getAppMint(appConfig, options.mint);

    final request = CloseAccountRequest(
      account: options.account,
      commitment: commitment,
      environment: sdkConfig.environment,
      index: sdkConfig.index,
      mint: mint.publicKey,
      referenceId: options.referenceId,
      referenceType: options.referenceType,
    );

    return accountApi.closeAccount(request);
  }

  Future<Transaction?> createAccount(CreateAccountOptions options) async {
    var appConfig = _ensureAppConfig();
    Commitment commitment = _getCommitment(options.commitment);
    AppConfigMint? mint = _getAppMint(appConfig, options.mint);

    PrepareTransactionResponse blockhash = await _getBlockhash();

    SignedTx tx = await generateCreateAccountTransaction(GenerateCreateAccountOptions(
      addMemo: mint.addMemo,
      blockhash: blockhash.blockhash,
      index: sdkConfig.index,
      lastValidBlockHeight: blockhash.lastValidBlockHeight,
      mintFeePayer: mint.feePayer,
      mintPublicKey: mint.publicKey,
      owner: options.owner,
    ));

    final request = CreateAccountRequest(
      commitment: commitment,
      environment: sdkConfig.environment,
      index: sdkConfig.index,
      lastValidBlockHeight: blockhash.lastValidBlockHeight,
      mint: mint.publicKey,
      referenceId: options.referenceId,
      referenceType: options.referenceType,
      tx: tx.encode(),
    );

    return accountApi.createAccount(request);
  }

  Future<AppConfig?> getAppConfig(String environment, int index) async {
    appConfig = await appApi.getAppConfig(environment, index);
    if (appConfig == null) {
      throw Exception("Unable to get app config");
    }
    return appConfig;
  }

  Future<AccountInfo?> getAccountInfo(GetAccountInfoOptions options) async {
    Commitment commitment = _getCommitment(options.commitment);

    return accountApi.getAccountInfo(
      sdkConfig.environment,
      sdkConfig.index,
      options.account,
      commitment,
    );
  }

  Future<BalanceResponse?> getBalance(GetBalanceOptions options) async {
    Commitment commitment = _getCommitment(options.commitment);

    return accountApi.getBalance(
      sdkConfig.environment,
      sdkConfig.index,
      options.account,
      commitment,
    );
  }

  Future<List<HistoryResponse>?> getHistory(GetHistoryOptions options) async {
    var appConfig = _ensureAppConfig();
    Commitment commitment = _getCommitment(options.commitment);
    AppConfigMint? mint = _getAppMint(appConfig, options.mint);

    return accountApi.getHistory(
      sdkConfig.environment,
      sdkConfig.index,
      options.account,
      mint.publicKey,
      commitment,
    );
  }

  Future<List<String>?> getTokenAccounts(GetTokenAccountsOptions options) async {
    var appConfig = _ensureAppConfig();
    Commitment commitment = _getCommitment(options.commitment);
    AppConfigMint? mint = _getAppMint(appConfig, options.mint);

    List<String>? result = await accountApi.getTokenAccounts(
      sdkConfig.environment,
      sdkConfig.index,
      options.account,
      mint.publicKey,
      commitment,
    );

    return result;
  }

  Future<GetTransactionResponse?> getTransaction(GetTransactionOptions options) {
    Commitment commitment = _getCommitment(options.commitment);

    return transactionApi.getTransaction(
      sdkConfig.environment,
      sdkConfig.index,
      options.signature,
      commitment,
    );
  }

  Future<Transaction?> makeTransfer(MakeTransferOptions options) async {
    var appConfig = _ensureAppConfig();
    AppConfigMint? mint = _getAppMint(appConfig, options.mint);

    var commitment = options.commitment ?? Commitment.confirmed;
    var destination = options.destination;
    var senderCreate = options.senderCreate ?? false;

    _validateDestination(appConfig, destination);

    List<String>? accounts = await getTokenAccounts(GetTokenAccountsOptions(
      account: options.destination,
      mint: mint.publicKey,
    ));

    if (!senderCreate && (accounts == null || accounts.isEmpty)) {
      throw Exception("Destination account does not exist");
    }

    PrepareTransactionResponse blockhash = await _getBlockhash();

    SignedTx tx = await generateMakeTransferTransaction(GenerateMakeTransferOptions(
      addMemo: mint.addMemo,
      amount: options.amount,
      blockhash: blockhash.blockhash,
      destination: options.destination,
      index: sdkConfig.index,
      lastValidBlockHeight: blockhash.lastValidBlockHeight,
      mintDecimals: mint.decimals,
      mintFeePayer: mint.feePayer,
      mintPublicKey: mint.publicKey,
      owner: options.owner,
      senderCreate: options.senderCreate,
      type: options.type ?? TransactionType.none,
    ));

    final request = MakeTransferRequest(
      commitment: commitment,
      environment: sdkConfig.environment,
      index: sdkConfig.index,
      lastValidBlockHeight: blockhash.lastValidBlockHeight,
      mint: mint.publicKey,
      referenceId: options.referenceId,
      referenceType: options.referenceType,
      tx: tx.encode(),
    );

    return transactionApi.makeTransfer(request);
  }

  Future<RequestAirdropResponse?> requestAirdrop(RequestAirdropOptions options) async {
    var appConfig = _ensureAppConfig();
    AppConfigMint? mint = _getAppMint(appConfig, options.mint);

    return airdropApi.requestAirdrop(RequestAirdropRequest(
      account: options.account,
      amount: options.amount,
      commitment: options.commitment ?? Commitment.confirmed,
      environment: sdkConfig.environment,
      index: sdkConfig.index,
      mint: mint.publicKey,
    ));
  }

  AppConfig _ensureAppConfig() {
    if (appConfig == null) {
      throw KineticInitializationException();
    }

    return appConfig!;
  }

  AppConfigMint _getAppMint(AppConfig appConfig, String? mint) {
    mint = mint ?? appConfig.mint.publicKey;
    final AppConfigMint? found = appConfig.mints.firstWhere((element) => element.publicKey == mint);
    if (found == null) {
      throw KineticMissingMintsException();
    }
    return found;
  }

  Commitment _getCommitment(Commitment? commitment) {
    return commitment ?? sdkConfig.commitment ?? Commitment.confirmed;
  }

  Future<PrepareTransactionResponse> _getBlockhash() async {
    LatestBlockhashResponse? latestBlockhashResponse =
        await transactionApi.getLatestBlockhash(sdkConfig.environment, sdkConfig.index);

    String blockhash = latestBlockhashResponse?.blockhash ?? "";
    int lastValidBlockHeight = latestBlockhashResponse?.lastValidBlockHeight ?? 0;

    return PrepareTransactionResponse(
      blockhash: blockhash,
      lastValidBlockHeight: lastValidBlockHeight,
    );
  }

  void _validateDestination(AppConfig appConfig, String destination) {
    if (destination.isEmpty) {
      throw Exception("Destination is required");
    }
  }
}

class PrepareTransactionResponse {
  final String blockhash;
  final int lastValidBlockHeight;
  PrepareTransactionResponse({required this.blockhash, required this.lastValidBlockHeight});
}
