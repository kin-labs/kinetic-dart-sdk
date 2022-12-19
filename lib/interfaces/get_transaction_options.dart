import 'package:kinetic/generated/lib/api.dart';

class GetTransactionOptions {
  GetTransactionOptions({
    required this.signature,
    this.commitment,
  });

  late Commitment? commitment;
  late String signature;
}
