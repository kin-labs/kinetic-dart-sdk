import 'package:kinetic/generated/lib/api.dart';
import 'package:solana/solana.dart' as solana;

class RequestAirdropOptions {
  RequestAirdropOptions({required this.account, required this.mint, required this.amount, required this.commitment});

  late solana.Ed25519HDPublicKey account;
  late solana.Ed25519HDPublicKey mint;
  late String amount;
  late RequestAirdropRequestCommitmentEnum commitment;
}