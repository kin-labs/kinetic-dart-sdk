import 'package:solana/solana.dart' as solana;

class GetBalanceOptions {
  GetBalanceOptions({required this.account,});

  late solana.Ed25519HDPublicKey account;
}