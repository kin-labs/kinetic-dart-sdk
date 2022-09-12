import 'package:solana/solana.dart' as solana;

class GetTokenAccountsOptions {
  GetTokenAccountsOptions({required this.account, required this.mint});

  late solana.Ed25519HDPublicKey account;
  late solana.Ed25519HDPublicKey mint;
}