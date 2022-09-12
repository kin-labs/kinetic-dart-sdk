import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:solana/solana.dart' as solana;
import 'package:kinetic/interfaces/transfer_destination.dart';

class MakeTransferOptions implements TransferDestination {
  MakeTransferOptions({
    required this.amount,
    required this.destination,
    required this.commitment,
    required this.mint,
    required this.owner,
    required this.referenceId,
    required this.referenceType,
    required this.type
  });

  @override
  String amount;

  @override
  solana.Ed25519HDPublicKey destination;

  late MakeTransferRequestCommitmentEnum commitment;
  late String mint;
  late solana.Ed25519HDKeyPair owner;
  late String referenceId;
  late String referenceType;
  late TransactionType type;

}