import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:solana/solana.dart' as solana;

class GenerateMakeTransferOptions {
  GenerateMakeTransferOptions({required this.addMemo, required this.amount, required this.appIndex, required this.destination, required this.lastValidBlockHeight, required this.latestBlockhash, required this.mintDecimals, required this.mintFeePayer, required this.mintPublicKey, required this.signer, required this.senderATA, required this.senderCreate, required this.type});

  late bool addMemo;
  late String amount;
  late int appIndex;
  late solana.Ed25519HDPublicKey destination;
  late int lastValidBlockHeight;
  late String latestBlockhash;
  late int mintDecimals;
  late String mintFeePayer;
  late String mintPublicKey;
  late solana.Ed25519HDKeyPair signer;
  late String senderATA;
  late bool senderCreate;
  late TransactionType type;
}