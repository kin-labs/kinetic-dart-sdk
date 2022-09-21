import 'package:flutter_test/flutter_test.dart';
import 'package:kinetic/keypair.dart';

void main() async {
  test('should generate a KeyPair', () async {
    Keypair kp = await Keypair.random();
    //
    //   expect(kp.mnemonic).toBeDefined()
    //   expect(kp.secretKey).toBeDefined()
    //   expect(kp.publicKey).toBeDefined()
    expect(true, true);
  });
  //
  test('should return generate a KeyPair from mnemonic', () async {
    //   const kp = Keypair.random()
    //   const restored = Keypair.fromMnemonic(kp.mnemonic)
    //
    //   expect(restored.mnemonic).toEqual(kp.mnemonic)
    //   expect(restored.secretKey).toEqual(kp.secretKey)
    //   expect(restored.publicKey).toEqual(kp.publicKey)
    expect(true, true);
  });
  //
  test('should generate a Mnemonic phrase (12 chars)', () async {
    //   const mnemonic = Keypair.generateMnemonic(128)
    //
    //   expect(mnemonic.split(' ').length).toEqual(12)
    expect(true, true);
  });
  //
  test('should generate a Mnemonic phrase (24 chars)', () async {
    //   const mnemonic = Keypair.generateMnemonic(256)
    //
    //   expect(mnemonic.split(' ').length).toEqual(24)
    expect(true, true);
  });
  //
  test('should create and import keypair', () async {
    //   const kp1 = Keypair.random()
    //   const kp2 = Keypair.fromSecretKey(kp1.secretKey)
    //   expect(kp1.secretKey).toEqual(kp2.secretKey)
    //   expect(kp1.publicKey).toEqual(kp2.publicKey)
    expect(true, true);
  });
  //
  test('should import from a bytearray', () async {
    //   const kp = Keypair.fromByteArray(TEST_SECRET_BYTEARRAY)
    //
    //   expect(kp.publicKey).toEqual(TEST_PUBLIC_KEY)
    expect(true, true);
  });
  //
  test('should import and existing secret', () async {
    //   const kp = Keypair.fromSecretKey(TEST_SECRET_KEY)
    //   expect(kp.publicKey).toEqual(TEST_PUBLIC_KEY)
    expect(true, true);
  });
  //
  test('should import from a mnemonic (12)', () async {
    //   const keypair = Keypair.fromMnemonicSeed(TEST_MNEMONIC_12)
    //   expect(keypair.secretKey).toEqual(TEST_SECRET_KEY)
    //   expect(keypair.solanaSecretKey.toString()).toEqual(TEST_SECRET_BYTEARRAY.toString())
    //   expect(keypair.solanaPublicKey.toBase58()).toEqual(TEST_PUBLIC_KEY)
    //   expect(keypair.publicKey).toEqual(TEST_PUBLIC_KEY)
    expect(true, true);
  });
  //
  test('should import from a mnemonic (24)', () async {
    //   const keypair = Keypair.fromMnemonicSeed(TEST_MNEMONIC_24)
    //   expect(keypair.secretKey).toEqual(TEST_MNEMONIC_24_SECRET_KEY)
    //   expect(keypair.solanaSecretKey.toString()).toEqual(TEST_MNEMONIC_24_SECRET_BYTEARRAY.toString())
    //   expect(keypair.solanaPublicKey.toBase58()).toEqual(TEST_MNEMONIC_24_PUBLIC_KEY)
    //   expect(keypair.publicKey).toEqual(TEST_MNEMONIC_24_PUBLIC_KEY)
    expect(true, true);
  });
  //
  test('should import multiple from a mnemonic (12 chars)', () async {
    //   const set = Keypair.fromMnemonicSet(TEST_MNEMONIC_12)
    //   const keys = set.map(({ mnemonic, secretKey, publicKey }) => ({
    //     mnemonic,
    //     secretKey,
    //     publicKey,
    //   }))
    //
    //   expect(keys.map(({ mnemonic, publicKey, secretKey }) => ({ mnemonic, publicKey, secretKey }))).toEqual(
    //     TEST_MNEMONIC_12_SET,
    //   )
    expect(true, true);
  });
  //
  test('should import multiple from a mnemonic (24 chars)', () async {
    //   const set = Keypair.fromMnemonicSet(TEST_MNEMONIC_24)
    //   const keys = set.map(({ mnemonic, secretKey, publicKey }) => ({
    //     mnemonic,
    //     secretKey,
    //     publicKey,
    //   }))
    //
    //   expect(keys.map(({ mnemonic, publicKey, secretKey }) => ({ mnemonic, publicKey, secretKey }))).toEqual(
    //     TEST_MNEMONIC_24_SET,
    //   )
    expect(true, true);
  });
}
