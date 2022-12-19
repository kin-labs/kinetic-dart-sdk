import 'package:kinetic/generated/lib/api.dart';

class GetAccountInfoOptions {
  GetAccountInfoOptions({
    required this.account,
    this.commitment,
  });

  late String account;
  late Commitment? commitment;
}
