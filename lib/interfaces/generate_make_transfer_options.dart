import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:solana/solana.dart' as solana;

class GenerateMakeTransferOptions {
  GenerateMakeTransferOptions({
    required this.addMemo,
    required this.amount,
    required this.appIndex,
    required this.destination,
    required this.lastValidBlockHeight,
    required this.latestBlockhash,
    required this.mintDecimals,
    required this.mintFeePayer,
    required this.mintPublicKey,
    required this.ownerTokenAccount,
    required this.signer,
    required this.type,
    this.senderCreate,
  });

  late bool addMemo;
  late String amount;
  late int appIndex;
  late String destination;
  late int lastValidBlockHeight;
  late String latestBlockhash;
  late int mintDecimals;
  late String mintFeePayer;
  late String mintPublicKey;
  late String ownerTokenAccount;
  late solana.Ed25519HDKeyPair signer;
  late bool? senderCreate;
  late TransactionType type;
}
