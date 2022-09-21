import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/interfaces/transfer_destination.dart';
import 'package:kinetic/keypair.dart';

class MakeTransferOptions implements TransferDestination {
  MakeTransferOptions(
      {required this.amount,
      required this.destination,
      required this.owner,
      this.commitment,
      this.mint,
      this.referenceId,
      this.referenceType,
      this.senderCreate,
      this.type});

  @override
  late String amount;
  @override
  late String destination;

  late MakeTransferRequestCommitmentEnum? commitment;
  late String? mint;
  late Keypair owner;
  late String? referenceId;
  late String? referenceType;
  late bool? senderCreate;
  late TransactionType? type;
}
