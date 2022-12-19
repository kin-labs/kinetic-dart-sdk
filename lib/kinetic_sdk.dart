library kinetic;

import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/helpers/get_solana_rpc_endpoint.dart';
import 'package:kinetic/helpers/validate_kinetic_sdk_config.dart';
import 'package:kinetic/interfaces/close_account_options.dart';
import 'package:kinetic/interfaces/create_account_options.dart';
import 'package:kinetic/interfaces/get_account_info_options.dart';
import 'package:kinetic/interfaces/get_balance_options.dart';
import 'package:kinetic/interfaces/get_history_options.dart';
import 'package:kinetic/interfaces/get_token_accounts_options.dart';
import 'package:kinetic/interfaces/get_transaction_options.dart';
import 'package:kinetic/interfaces/kinetic_sdk_config.dart';
import 'package:kinetic/interfaces/make_transfer_options.dart';
import 'package:kinetic/interfaces/request_airdrop_options.dart';
import 'package:kinetic/kinetic_sdk_internal.dart';
import 'package:kinetic/solana.dart';
import 'package:kinetic/version.dart';

class KineticSdk {
  late Solana solana;

  late KineticSdkInternal _internal;
  final KineticSdkConfig sdkConfig;

  KineticSdk(this.sdkConfig) {
    _internal = KineticSdkInternal(sdkConfig);
  }

  AppConfig? get config => _internal.appConfig;

  String? get endpoint => sdkConfig.endpoint;

  Future<Transaction?> closeAccount(CloseAccountOptions options) async {
    return _internal.closeAccount(options);
  }

  Future<Transaction?> createAccount(CreateAccountOptions options) async {
    return _internal.createAccount(options);
  }

  Future<AccountInfo?> getAccountInfo(GetAccountInfoOptions options) async {
    return _internal.getAccountInfo(options);
  }

  Future<BalanceResponse?> getBalance(GetBalanceOptions options) async {
    return _internal.getBalance(options);
  }

  Future<String?> getExplorerUrl(String path) async {
    return _internal.appConfig?.environment.explorer.replaceAll("{path}", path);
  }

  Future<List<HistoryResponse>?> getHistory(GetHistoryOptions options) async {
    return _internal.getHistory(options);
  }

  Future<List<String>?> getTokenAccounts(GetTokenAccountsOptions options) async {
    return _internal.getTokenAccounts(options);
  }

  Future<GetTransactionResponse?> getTransaction(GetTransactionOptions options) async {
    return _internal.getTransaction(options);
  }

  Future<Transaction?> makeTransfer(MakeTransferOptions options) async {
    return _internal.makeTransfer(options);
  }

  Future<RequestAirdropResponse?> requestAirdrop(RequestAirdropOptions options) async {
    return _internal.requestAirdrop(options);
  }

  Future<AppConfig?> init() async {
    try {
      sdkConfig.logger?.i('$name: initializing KineticSdk');
      var config = await _internal.getAppConfig(sdkConfig.environment, sdkConfig.index);

      sdkConfig.solanaRpcEndpoint = sdkConfig.solanaRpcEndpoint != null
          ? getSolanaRpcEndpoint(sdkConfig.solanaRpcEndpoint as String)
          : getSolanaRpcEndpoint(config?.environment.cluster.endpoint as String);

      sdkConfig.solanaWssEndpoint = sdkConfig.solanaRpcEndpoint?.replaceAll('http', 'ws') as String;

      solana = Solana(solanaRpcEndpoint: sdkConfig.solanaRpcEndpoint!);

      sdkConfig.logger?.i(
          "$name: endpoint '${sdkConfig.endpoint}', environment '${sdkConfig.environment}', index: ${config?.app.index}");
      return config;
    } catch (e) {
      sdkConfig.logger?.e('Error initializing Server. ${e.toString()}');
      rethrow;
    }
  }

  static Future<KineticSdk> setup(KineticSdkConfig sdkConfig) async {
    var sdk = KineticSdk(validateKineticSdkConfig(sdkConfig));
    try {
      await sdk.init();
      sdkConfig.logger?.i('$name: Setup Done');
      return sdk;
    } catch (e) {
      sdkConfig.logger?.e('$name: Error setting up SDK. ${e.toString()}');
      rethrow;
    }
  }
}
