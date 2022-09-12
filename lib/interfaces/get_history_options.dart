import 'package:solana/solana.dart' as solana;

class GetHistoryOptions {
  GetHistoryOptions({required this.account, required this.mint});

  late solana.Ed25519HDPublicKey account;
  late solana.Ed25519HDPublicKey mint;
}