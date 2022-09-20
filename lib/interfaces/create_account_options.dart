import 'package:kinetic/generated/lib/api.dart';
import 'package:solana/solana.dart' as solana;

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
  late solana.Ed25519HDKeyPair owner;
  late String? referenceId;
  late String? referenceType;
}
