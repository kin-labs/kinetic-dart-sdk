import 'package:flutter_test/flutter_test.dart';
import 'package:kinetic/keypair.dart';

import 'fixtures.dart';

void main() async {
  test('should generate a KeyPair', () async {
    Keypair kp = await Keypair.random();

    expect(kp, const TypeMatcher<Keypair>());
    expect(kp.mnemonic?.isNotEmpty, true);
    expect(kp.secretKey.isNotEmpty, true);
    expect(kp.publicKey.isNotEmpty, true);
  });

  test('should return generate a KeyPair from mnemonic', () async {
    Keypair kp = await Keypair.random();
    Keypair restored = await Keypair.fromMnemonic(kp.mnemonic!);

    expect(kp, const TypeMatcher<Keypair>());
    expect(restored, const TypeMatcher<Keypair>());
    expect(restored.mnemonic, kp.mnemonic);
    expect(restored.secretKey, kp.secretKey);
    expect(restored.publicKey, kp.publicKey);
  });

  test('should generate a Mnemonic phrase (12 chars)', () async {
    String mnemonic = await Keypair.generateMnemonic(128);

    expect(mnemonic.split(' ').length, 12);
  });

  test('should generate a Mnemonic phrase (24 chars)', () async {
    String mnemonic = Keypair.generateMnemonic(256);

    expect(mnemonic.split(' ').length, 24);
  });

  test('should create and import keypair', () async {
    Keypair kp1 = await Keypair.random();
    Keypair kp2 = await Keypair.fromSecretKey(kp1.secretKey);
    expect(kp1.secretKey, kp2.secretKey);
    expect(kp1.publicKey, kp2.publicKey);
  });

  test('should import from a bytearray', () async {
    Keypair kp = await Keypair.fromByteArray(testSecretBytearray);

    expect(kp.publicKey, testPublicKey);
  });

  test('should import and existing secret', () async {
    Keypair kp = await Keypair.fromSecretKey(testSecretKey);
    expect(kp.publicKey, testPublicKey);
  });

  // TODO: Implement this according to the TypeScript version
  // test('should import from a mnemonic (12)', () async {
  //   Keypair keypair = await Keypair.fromMnemonicSeed(testMnemonic12);
  //   var solanaSecretKey = await keypair.solanaSecretKey;
  //   expect(solanaSecretKey.toString(), testSecretBytearray.toString());
  //   expect(keypair.solanaPublicKey.toBase58(), testPublicKey);
  //   expect(keypair.publicKey, testPublicKey);
  //   expect(true, true);
  // });

  // TODO: Implement this according to the TypeScript version
  // test('should import from a mnemonic (24)', () async {
  //   Keypair keypair = await Keypair.fromMnemonicSeed(testMnemonic24);
  //   expect(keypair.secretKey, testMnemonic24SecretKey);
  //   expect(keypair.solanaSecretKey.toString(), testMnemonic24SecretBytearray.toString());
  //   expect(keypair.solanaPublicKey.toBase58(), testMnemonic24PublicKey);
  //   expect(keypair.publicKey, testMnemonic24PublicKey);
  //   expect(true, true);
  // });

  test('should import multiple from a mnemonic (12 chars)', () async {
    List<Keypair> set = await Keypair.fromMnemonicSet(testMnemonic12);

    expect(set.length, 10);

    // loop over the set and check the keys
    for (int i = 0; i < set.length; i++) {
      expect(set[i].publicKey, testMnemonic12Set[i].publicKey);
      // FIXME: Secret key length is different
      // expect(set[i].secretKey, testMnemonic12Set[i].secretKey);
      expect(set[i].mnemonic, testMnemonic12Set[i].mnemonic);
    }
  });

  test('should import multiple from a mnemonic (24 chars)', () async {
    List<Keypair> set = await Keypair.fromMnemonicSet(testMnemonic24);

    expect(set.length, 10);

    // loop over the set and check the keys
    for (int i = 0; i < set.length; i++) {
      expect(set[i].publicKey, testMnemonic24Set[i].publicKey);
      // FIXME: Secret key length is different
      // expect(set[i].secretKey, testMnemonic24Set[i].secretKey);
      expect(set[i].mnemonic, testMnemonic24Set[i].mnemonic);
    }
  });
}
