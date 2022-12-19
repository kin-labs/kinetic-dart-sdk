import 'package:kinetic/generated/lib/api.dart';

class CloseAccountOptions {
  CloseAccountOptions({
    required this.account,
    this.commitment,
    this.mint,
    this.referenceId,
    this.referenceType,
  });

  late String account;
  late Commitment? commitment;
  late String? mint;
  late String? referenceId;
  late String? referenceType;
}
