import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:bs58/bs58.dart';
import 'package:solana/solana.dart';

class Keypair {
  late Ed25519HDKeyPair _keypair;

  get keypair => _keypair;

  Ed25519HDPublicKey get solanaPublicKey => _keypair.publicKey;

  Future<List<int>> get solanaRawSecret async {
    return await _extractPkb();
  }

  Future<String> get solanaSecretKey async {
    var _p = await _extractPkb();
    var _u = Uint8List.fromList(_p);
    return base58.encode(_u);
  }

  static Future<Ed25519HDKeyPair> random() async {
    return await Ed25519HDKeyPair.random();
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

  Future<Ed25519HDKeyPair> fromByteArray(List<int> pkb) async {
    _keypair = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: pkb.take(32).toList());
    return _keypair;
  }
}
