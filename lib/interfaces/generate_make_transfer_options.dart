import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:solana/solana.dart' as solana;

class GenerateMakeTransferOptions {
  GenerateMakeTransferOptions({
    required this.addMemo,
    required this.amount,
    required this.blockhash,
    required this.destination,
    required this.index,
    required this.lastValidBlockHeight,
    required this.mintDecimals,
    required this.mintFeePayer,
    required this.mintPublicKey,
    required this.owner,
    required this.type,
    this.senderCreate,
  });

  late bool addMemo;
  late String amount;
  late String blockhash;
  late String destination;
  late int index;
  late int lastValidBlockHeight;
  late int mintDecimals;
  late String mintFeePayer;
  late String mintPublicKey;
  late solana.Ed25519HDKeyPair owner;
  late bool? senderCreate;
  late TransactionType type;
}
