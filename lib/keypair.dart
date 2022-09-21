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

  static String generateMnemonic([int? strength = 128]) {
    return bip39.generateMnemonic(strength: strength ?? 128);
  }

  static Future<Keypair> fromByteArray(List<int> bytes) async {
    return _fromEd25519HDKeyPair(await _fromEd25519ByteArray(bytes));
  }

  static Future<Keypair> fromMnemonic(String mnemonic) async {
    Ed25519HDKeyPair x = await Ed25519HDKeyPair.fromMnemonic(mnemonic, account: 0);
    Keypair kp = await _fromEd25519HDKeyPair(x);

    return _create(kp.secretKey, mnemonic);
  }

  // TODO: Implement this according to the TypeScript version
  // static Future<Keypair> fromMnemonicSeed(String mnemonic) async {
  //   return fromMnemonic(mnemonic);
  // }

  static Future<List<Keypair>> fromMnemonicSet(String mnemonic, [int? from = 0, to = 10]) async {
    // Always start with zero as minimum
    if (from == null || from < 0) {
      from = 0;
    }
    // Always generate at least 1
    if (to == null || to <= from) {
      to = 1;
    }

    // loop over the range 'to' to 'from'
    List<Keypair> keys = [];
    for (var i = from; i < to; i++) {
      Keypair kp = await _fromEd25519HDKeyPair(await Ed25519HDKeyPair.fromMnemonic(mnemonic, account: i));

      keys.add(await _create(kp.secretKey, mnemonic));
    }

    return keys;
  }

  static Future<Keypair> fromSecretKey(String secretKey) async {
    return _create(secretKey, null);
  }

  static Future<Keypair> fromSeed(List<int> seed) async {
    return _fromEd25519HDKeyPair(await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: seed));
  }

  static Future<Keypair> random() async {
    var mnemonic = generateMnemonic();
    return fromMnemonic(mnemonic);
  }

  static Future<Keypair> _create(String secretKey, String? mnemonic) async {
    Ed25519HDKeyPair solanaKeypair = await _fromEd25519ByteArray(base58.decode(secretKey));

    return Keypair(secretKey: secretKey, solanaKeypair: solanaKeypair, mnemonic: mnemonic);
  }

  static Future<Ed25519HDKeyPair> _fromEd25519ByteArray(List<int> bytes) async {
    return Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: bytes.take(32).toList());
  }

  static Future<Keypair> _fromEd25519HDKeyPair(Ed25519HDKeyPair kp) async {
    var extracted = await kp.extract();
    var secretKey = base58.encode(Uint8List.fromList(extracted.bytes));
    return fromSecretKey(secretKey);
  }
}
