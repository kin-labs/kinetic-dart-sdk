import 'package:kinetic/generated/lib/api.dart';

class GetAccountInfoOptions {
  GetAccountInfoOptions({
    required this.account,
    this.commitment,
    this.mint,
  });

  late String account;
  late Commitment? commitment;
  late String? mint;
}
