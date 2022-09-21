import 'package:kinetic/keypair.dart';

class GenerateCreateAccountOptions {
  GenerateCreateAccountOptions({
    required this.addMemo,
    required this.blockhash,
    required this.index,
    required this.lastValidBlockHeight,
    required this.mintFeePayer,
    required this.mintPublicKey,
    required this.owner,
  });

  late bool addMemo;
  late String blockhash;
  late int index;
  late int lastValidBlockHeight;
  late String mintFeePayer;
  late String mintPublicKey;
  late Keypair owner;
}
