import 'package:solana/solana.dart' as solana;

class GenerateCreateAccountOptions {
  GenerateCreateAccountOptions({
    required this.addMemo,
    required this.blockhash,
    required this.index,
    required this.lastValidBlockHeight,
    required this.mintFeePayer,
    required this.mintPublicKey,
    required this.signer,
  });

  late bool addMemo;
  late String blockhash;
  late int index;
  late int lastValidBlockHeight;
  late String mintFeePayer;
  late String mintPublicKey;
  late solana.Ed25519HDKeyPair signer;
}
