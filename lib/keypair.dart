import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:bs58/bs58.dart';
import 'package:solana/solana.dart';

class Keypair {
  final String secretKey;
  late String publicKey;
  final String? mnemonic;

  late Ed25519HDKeyPair _solanaKeypair;

  Keypair({required Ed25519HDKeyPair solanaKeypair, required this.secretKey, this.mnemonic}) {
    _solanaKeypair = solanaKeypair;
    publicKey = _solanaKeypair.publicKey.toString();
  }

  get solana => _solanaKeypair;

  Ed25519HDPublicKey get solanaPublicKey => _solanaKeypair.publicKey;

  Future<List<int>> get solanaSecretKey async {
    final simpleKeyPairData = await _solanaKeypair.extract();
    return simpleKeyPairData.bytes;
  }

  static Future<Keypair> derive(List<int> sd, String hdPath) async {
    return _fromEd25519HDKeyPair(await Ed25519HDKeyPair.fromSeedWithHdPath(seed: sd, hdPath: hdPath));
  }

  static String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  static Future<Keypair> fromByteArray(List<int> pkb) async {
    return _fromEd25519HDKeyPair(await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: pkb.take(32).toList()));
  }

  static Future<Keypair> fromMnemonic(String mnemonic) async {
    return _fromEd25519HDKeyPair(await Ed25519HDKeyPair.fromMnemonic(mnemonic, account: 0));
  }

  static Future<Keypair> fromSecretKey(String secretKey) async {
    return Keypair._create(secretKey);
  }

  static Future<Keypair> fromSeed(List<int> seed) async {
    return _fromEd25519HDKeyPair(await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: seed));
  }

  static Future<Keypair> random() async {
    return _fromEd25519HDKeyPair(await Ed25519HDKeyPair.random());
  }

  static Future<Keypair> _create(String secretKey) async {
    Ed25519HDKeyPair solanaKeypair = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: base58.decode(secretKey));

    return Keypair(secretKey: secretKey, solanaKeypair: solanaKeypair);
  }

  static Future<Keypair> _fromEd25519HDKeyPair(Ed25519HDKeyPair kp) async {
    var extracted = await kp.extract();
    var secretKey = base58.encode(Uint8List.fromList(extracted.bytes));
    return Keypair.fromSecretKey(secretKey);
  }
}
