library kinetic;

import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/identifiers/version.dart';
import 'package:kinetic/kinetic_sdk_internal.dart';
import 'package:logger/logger.dart';

import 'exceptions.dart';
import 'interfaces/create_account_options.dart';
import 'interfaces/get_balance_options.dart';
import 'interfaces/get_history_options.dart';
import 'interfaces/get_token_accounts_options.dart';
import 'interfaces/kinetic_sdk_config.dart';
import 'interfaces/make_transfer_options.dart';

class KineticSdk {
  late KineticSdkConfig sdkConfig;
  late KineticSdkInternal _internal;

  KineticSdk._internal();

  static final KineticSdk _kinetic = KineticSdk._internal();

  factory KineticSdk() {
    return _kinetic;
  }

  Future<bool> setup({required KineticSdkConfig sdkConfig}) async {
    this.sdkConfig = sdkConfig;
    _internal = KineticSdkInternal(sdkConfig);
    bool ok = await init();
    return ok;
  }

  bool initialized = false;
  AppConfig? appConfig;

  Future<bool> init() async {
    var _ap = await getAppConfig();
    sdkConfig.logger.log(Level.info, "$name: initializing $name@$version");
    if (appConfig?.app.index == sdkConfig.index) {
      initialized = true;
    }
    return initialized;
  }

  checkInit() {
    initialized == false ? throw KineticInitializationException() : null;
  }

  Future<AppConfig?> getAppConfig() async {
    appConfig = await _internal.getAppConfigImpl(sdkConfig);

    return appConfig;
  }

  Future<String?> getExplorerUrl({required String path}) async {
    checkInit();
    var rUrl = appConfig?.environment.explorer;
    var url = rUrl?.replaceAll("{path}", path);
    return url;
  }

  Future<BalanceResponse?> getBalance({required GetBalanceOptions balanceOptions}) async {
    checkInit();
    BalanceResponse? res = await _internal.getBalanceImpl(sdkConfig, balanceOptions.account.toBase58());
    return res;
  }

  Future<List<HistoryResponse>?> getHistory({required GetHistoryOptions historyOptions}) async {
    checkInit();
    List<HistoryResponse>? res = await _internal.getHistoryImpl(sdkConfig, historyOptions.account.toBase58(), historyOptions.mint.toBase58());
    return res;
  }

  Future<List<String>?> getTokenAccounts({required GetTokenAccountsOptions tokenAccountsOptions}) async {
    checkInit();
    List<String>? res = await _internal.getTokenAccountsImpl(sdkConfig, tokenAccountsOptions.account.toBase58(), tokenAccountsOptions.mint.toBase58());
    return res;
  }

  Future<RequestAirdropResponse?> requestAirdrop({required RequestAirdropRequest airdropRequest}) async {
    checkInit();
    RequestAirdropResponse? res = await _internal.postRequestAirdropImpl(airdropRequest);
    return res;
  }

  Future<Transaction?> makeTransfer({required MakeTransferOptions makeTransferOptions, required bool senderCreate}) async {
    checkInit();
    Transaction? transaction = await _internal.makeTransferImpl(appConfig, sdkConfig, senderCreate, makeTransferOptions);
    return transaction;
  }

  Future<Transaction?> createAccount({required CreateAccountOptions createAccountOptions}) async {
    checkInit();
    Transaction? transaction = await _internal.createAccountImpl(appConfig, sdkConfig, createAccountOptions.mint, createAccountOptions.owner);
    return transaction;
  }

}