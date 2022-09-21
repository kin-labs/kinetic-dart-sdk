import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/keypair.dart';

class CreateAccountOptions {
  CreateAccountOptions({
    required this.owner,
    this.mint,
    this.commitment,
    this.referenceId,
    this.referenceType,
  });

  late CreateAccountRequestCommitmentEnum? commitment;
  late String? mint;
  late Keypair owner;
  late String? referenceId;
  late String? referenceType;
}
