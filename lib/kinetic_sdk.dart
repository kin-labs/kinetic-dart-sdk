library kinetic;

import 'package:kinetic/identifiers/version.dart';
import 'package:kinetic/kinetic_sdk_internal.dart';
import 'package:kinetic/models.dart';
import 'package:kinetic/tools.dart';
import 'package:logger/logger.dart';
import 'package:openapi/api.dart';
import 'package:solana/solana.dart';

import 'constants.dart';
import 'keypair.dart';

class KineticSdk {

  late KineticSdkConfig sdkConfig;
  late KineticSdkInternal _internal;
  late SolanaClient solanaClient;
  late Keypair keypair;

  KineticSdk._internal();

  static final KineticSdk _kinetic = KineticSdk._internal();

  factory KineticSdk() {
    return _kinetic;
  }

  Future<bool> setup({required KineticSdkConfig sdkConfig}) async {
    this.sdkConfig = sdkConfig;
    _internal = KineticSdkInternal();
    bool ok = await init();
    return ok;
  }

  bool initialized = false;
  Map<String, dynamic> appConfig = {};

  Future<bool> init() async {
    var _ap = await getAppConfig();
    sdkConfig.logger.log(Level.info, "$name: initializing $name@$version");
    safePrint(_ap);
    if (appConfig["app"]["index"] == sdkConfig.index) {
      solanaClient = SolanaClient(rpcUrl: Uri.parse(sdkConfig.solanaRpcEndpoint), websocketUrl: Uri.parse(sdkConfig.solanaWssEndpoint), timeout: timeoutDuration);
      keypair = Keypair();
      initialized = true;
    }
    return initialized;
  }

  Future<Map<String, dynamic>> getAppConfig() async {
    Map<String, dynamic> httpResponse = await _internal.getAppConfigImpl(sdkConfig);
    if (httpResponse["statusCode"] == 200) {
      appConfig = httpResponse["response"];
    }
    return httpResponse;
  }

  Future<Map<String, dynamic>> getBalance(GetBalanceOptions balanceOptions) async {
    checkInit();
    Map<String, dynamic> httpResponse = await _internal.getBalanceImpl(sdkConfig, balanceOptions.account.toBase58());
    return httpResponse;
  }

  Future<Map<String, dynamic>> getHistory(GetHistoryOptions historyOptions) async {
    checkInit();
    Map<String, dynamic> httpResponse = await _internal.getHistoryImpl(sdkConfig, historyOptions.account.toBase58(), historyOptions.mint.toBase58());
    return httpResponse;
  }

  Future<Map<String, dynamic>> getTokenAccounts(GetTokenAccountsOptions tokenAccountsOptions) async {
    checkInit();
    Map<String, dynamic> httpResponse = await _internal.getTokenAccountsImpl(sdkConfig, tokenAccountsOptions.account.toBase58(), tokenAccountsOptions.mint.toBase58());
    return httpResponse;
  }

  Future<String> getExplorerUrl(String path) async {
    checkInit();
    var rUrl = appConfig["environment"]["explorer"].toString();
    var url = rUrl.replaceAll("{path}", path);
    return url;
  }

  Future<Map<String, dynamic>> requestAirdrop(RequestAirdropOptions airdropOptions) async {
    checkInit();

    Map<String, dynamic> httpResponse = await _internal.postRequestAirdropImpl(sdkConfig, airdropOptions.account.toBase58(), airdropOptions.mint.toBase58(), double.parse(airdropOptions.amount));

    return httpResponse;
  }

  checkInit() {
    initialized == false ? throw KineticInitializationException() : null;
  }

  Future<AppTransaction?> makeTransfer({required MakeTransferOptions makeTransferOptions, required bool senderCreate}) async {
    checkInit();

    AppTransaction? appTransaction = await _internal.makeTransferImpl(appConfig, sdkConfig, solanaClient, senderCreate, makeTransferOptions);

    return appTransaction;
  }

  Future<Map<String, dynamic>> createAccount(CreateAccountOptions accountOptions) async {
    checkInit();

    Map<String, dynamic> httpResponse = await _internal.createAccountImpl(appConfig, sdkConfig, solanaClient, accountOptions.mint, accountOptions.owner);

    return httpResponse;
  }

}