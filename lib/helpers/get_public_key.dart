import 'package:solana/solana.dart';

Ed25519HDPublicKey getPublicKey(String publicKey) {
  return Ed25519HDPublicKey.fromBase58(publicKey);
}
