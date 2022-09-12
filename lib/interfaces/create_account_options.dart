import 'package:solana/solana.dart' as solana;
import 'package:kinetic/commitment.dart';

class CreateAccountOptions {
  CreateAccountOptions({required this.owner, required this.mint, required this.commitment});

  late Commitment commitment;
  late String mint;
  late solana.Ed25519HDKeyPair owner;
}