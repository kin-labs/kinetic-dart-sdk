import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/keypair.dart';

class GenerateMakeTransferOptions {
  GenerateMakeTransferOptions({
    required this.addMemo,
    required this.amount,
    required this.blockhash,
    required this.destination,
    required this.destinationTokenAccount,
    required this.index,
    required this.lastValidBlockHeight,
    required this.mintDecimals,
    required this.mintFeePayer,
    required this.mintPublicKey,
    required this.owner,
    required this.ownerTokenAccount,
    required this.type,
    this.senderCreate,
  });

  late bool addMemo;
  late String amount;
  late String blockhash;
  late String destination;
  late String destinationTokenAccount;
  late int index;
  late int lastValidBlockHeight;
  late int mintDecimals;
  late String mintFeePayer;
  late String mintPublicKey;
  late Keypair owner;
  late String ownerTokenAccount;
  late bool? senderCreate;
  late TransactionType type;
}
