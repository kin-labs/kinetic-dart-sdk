import 'package:solana/solana.dart' as solana;

abstract class TransferDestination {
  late String amount;
  late solana.Ed25519HDPublicKey destination;
}