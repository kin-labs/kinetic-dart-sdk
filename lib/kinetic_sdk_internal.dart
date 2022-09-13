import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/helpers/generate_create_account_transaction.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/solana.dart';

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

  KineticSdkInternal(this.sdkConfig) {
    // Create the API Configuration
    apiConfig = ApiClient(basePath: sdkConfig.endpoint);

    // Configure the APIs
    accountApi = AccountApi(apiConfig);
    airdropApi = AirdropApi(apiConfig);
    appApi = AppApi(apiConfig);
    transactionApi = TransactionApi(apiConfig);
  }

  Future<AppConfig?> getAppConfigImpl(KineticSdkConfig sdkConfig) async {
    AppConfig? config = await appApi.getAppConfig(sdkConfig.environment.name, sdkConfig.index);
    return config;
  }

  Future<BalanceResponse?> getBalanceImpl(KineticSdkConfig sdkConfig, String accountId) async {
    BalanceResponse? res = await accountApi.getBalance(sdkConfig.environment.name, sdkConfig.index, accountId);
    return res;
  }

  Future<List<HistoryResponse>?> getHistoryImpl(KineticSdkConfig sdkConfig, String accountId, String mint) async {
    List<HistoryResponse>? res = await accountApi.getHistory(sdkConfig.environment.name, sdkConfig.index, accountId, mint);
    return res;
  }

  Future<List<String>?> getTokenAccountsImpl(KineticSdkConfig sdkConfig, String accountId, String mint) async {
    List<String>? res = await accountApi.getTokenAccounts(sdkConfig.environment.name, sdkConfig.index, accountId, mint);
    return res;
  }

  Future<RequestAirdropResponse?> postRequestAirdropImpl(RequestAirdropRequest airdropRequest) async {
    RequestAirdropResponse? res = await airdropApi.requestAirdrop(airdropRequest);
    return res;
  }

  Future<Transaction?> makeTransferImpl(AppConfig? appConfig, KineticSdkConfig sdkConfig, bool senderCreate, MakeTransferOptions makeTransferOptions) async {
    checkDestination(appConfig, makeTransferOptions.destination.toBase58());
    String feePayer = getFeePayer(appConfig, makeTransferOptions.mint);
    int decimals = getDecimals(appConfig, makeTransferOptions.mint);

    Transaction? transaction = await generateMakeTransferTransaction(transactionApi, accountApi, sdkConfig, makeTransferOptions, makeTransferOptions.mint, decimals, feePayer, senderCreate);

    return transaction;
  }

  Future<Transaction?> createAccountImpl(AppConfig? appConfig, KineticSdkConfig sdkConfig, String mint, Ed25519HDKeyPair from) async {
    String feePayer = getFeePayer(appConfig, mint);
    Transaction? transaction = await generateCreateAccountTransaction(transactionApi, accountApi, sdkConfig, mint, from, feePayer);
    return transaction;
  }

}

