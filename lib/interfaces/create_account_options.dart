import 'package:kinetic/generated/lib/api.dart';
import 'package:solana/solana.dart' as solana;

class CreateAccountOptions {
  CreateAccountOptions({required this.owner, required this.mint, required this.commitment, required this.referenceId, required this.referenceType});

  late CreateAccountRequestCommitmentEnum commitment;
  late String mint;
  late solana.Ed25519HDKeyPair owner;
  late String referenceId;
  late String referenceType;
}