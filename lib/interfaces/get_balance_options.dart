import 'package:kinetic/generated/lib/api.dart';

class GetBalanceOptions {
  GetBalanceOptions({
    required this.account,
    this.commitment,
  });

  final String account;
  late Commitment? commitment;
}
