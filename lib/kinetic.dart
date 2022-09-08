library kinetic;

import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:bs58/bs58.dart';
import 'package:kinetic/api.dart';
import 'package:kinetic/models.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/solana.dart';

import 'constants.dart';

class Kinetic {

  late int index;
  late KineticSdkEnvironment environment;
  late KineticSdkConfig sdkConfig;
  late KineticApi _api;
  late SolanaClient solanaClient;
  late Keypair keypair;

  Kinetic._internal();

  static final Kinetic _kinetic = Kinetic._internal();

  factory Kinetic() {
    return _kinetic;
  }

  Future<bool> setup({required int index, required KineticSdkEnvironment environment}) async {
    this.index = index;
    this.environment = environment;
    sdkConfig = KineticSdkConfig(index: index, environment: environment);
    _api = KineticApi();
    bool ok = await init();
    return ok;
  }

  bool initialized = false;
  Map<String, dynamic> appConfig = {};

  Future<bool> init() async {
    var _ap = await getAppConfig();
    safePrint(_ap);
    if (appConfig["app"]["index"] == index) {
      solanaClient = SolanaClient(rpcUrl: Uri.parse(sdkConfig.solanaRpcEndpoint), websocketUrl: Uri.parse(sdkConfig.solanaWssEndpoint), timeout: timeoutDuration);
      keypair = Keypair();
      initialized = true;
    }
    return initialized;
  }

  Future<Map<String, dynamic>> getAppConfig() async {
    Map<String, dynamic> httpResponse = await _api.getAppConfigImpl(sdkConfig);
    if (httpResponse["statusCode"] == 200) {
      appConfig = httpResponse["response"];
    }
    return httpResponse;
  }

  Future<Map<String, dynamic>> getBalance(GetBalanceOptions balanceOptions) async {
    checkInit();
    Map<String, dynamic> httpResponse = await _api.getBalanceImpl(sdkConfig, balanceOptions.account.toBase58());
    return httpResponse;
  }

  Future<Map<String, dynamic>> getHistory(GetHistoryOptions historyOptions) async {
    checkInit();
    Map<String, dynamic> httpResponse = await _api.getHistoryImpl(sdkConfig, historyOptions.account.toBase58(), historyOptions.mint.toBase58());
    return httpResponse;
  }

  Future<Map<String, dynamic>> getTokenAccounts(GetTokenAccountsOptions tokenAccountsOptions) async {
    checkInit();
    Map<String, dynamic> httpResponse = await _api.getTokenAccountsImpl(sdkConfig, tokenAccountsOptions.account.toBase58(), tokenAccountsOptions.mint.toBase58());
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

    Map<String, dynamic> httpResponse = await _api.postRequestAirdropImpl(sdkConfig, airdropOptions.account.toBase58(), airdropOptions.mint.toBase58(), double.parse(airdropOptions.amount));

    return httpResponse;
  }

  checkInit() {
    initialized == false ? throw KineticInitializationException() : null;
  }

  Future<Map<String, dynamic>> makeTransfer({required MakeTransferOptions makeTransferOptions, required bool senderCreate}) async {
    checkInit();

    Map<String, dynamic> httpResponse = await _api.makeTransferImpl(appConfig, sdkConfig, solanaClient, senderCreate, makeTransferOptions);

    return httpResponse;
  }

  Future<Map<String, dynamic>> createAccount(CreateAccountOptions accountOptions) async {
    checkInit();

    Map<String, dynamic> httpResponse = await _api.createAccountImpl(appConfig, sdkConfig, solanaClient, accountOptions.mint, accountOptions.owner);

    return httpResponse;
  }

}

class Keypair {

  late Ed25519HDKeyPair _keypair;

  get keypair => _keypair;

  Ed25519HDPublicKey get solanaPublicKey => _keypair.publicKey;

  Future<List<int>> get solanaRawSecret async {
    return await _extractPkb();
  }

  Future<String> get solanaSecretKey async {
    var _p =  await _extractPkb();
    var _u = Uint8List.fromList(_p);
    return base58.encode(_u);
  }

  Future<Ed25519HDKeyPair> random() async {
    _keypair = await Ed25519HDKeyPair.random();
    return _keypair;
  }

  Future<List<int>> _extractPkb() async {
    final simpleKeyPairData = await _keypair.extract();
    return simpleKeyPairData.bytes;
  }

  Ed25519HDPublicKey publicKeyFromString(String base58String) {
    return Ed25519HDPublicKey.fromBase58(base58String);
  }

  Future<Ed25519HDKeyPair> fromMnemonic(String mnemonic) async {
    _keypair = await Ed25519HDKeyPair.fromMnemonic(mnemonic, account: 0);
    return _keypair;
  }

  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  Future<Ed25519HDKeyPair> derive(List<int> sd, String hdPath) async {
    _keypair = await Ed25519HDKeyPair.fromSeedWithHdPath(seed: sd, hdPath: hdPath);
    return _keypair;
  }

  Future<Ed25519HDKeyPair> fromSeed(List<int> sd) async {
    _keypair = await Ed25519HDKeyPair.fromSeedWithHdPath(seed: sd, hdPath: "m/44'/501'/0'/0'");
    return _keypair;
  }

  Future<Ed25519HDKeyPair> fromSecretKey(String sk) async {
    var _sb = base58.decode(sk);
    _keypair = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: _sb);
    return _keypair;
  }

  Future<Ed25519HDKeyPair> fromByteArray(List<int> kb) async {
    _keypair = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: kb);
    return _keypair;
  }

}