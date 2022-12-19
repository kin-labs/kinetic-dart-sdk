import 'package:kinetic/generated/lib/api.dart';

class GetTokenAccountsOptions {
  GetTokenAccountsOptions({
    required this.account,
    required this.mint,
    this.commitment,
  });

  late String account;
  late Commitment? commitment;
  late String mint;
}
