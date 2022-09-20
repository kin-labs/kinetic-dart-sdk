import 'package:kinetic/generated/lib/api.dart';

class RequestAirdropOptions {
  RequestAirdropOptions({
    required this.account,
    required this.amount,
    this.mint,
    this.commitment,
  });

  late String account;
  late String amount;
  late RequestAirdropRequestCommitmentEnum? commitment;
  late String? mint;
}
