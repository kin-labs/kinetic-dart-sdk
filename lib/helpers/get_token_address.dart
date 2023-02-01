import 'package:kinetic/helpers/get_public_key.dart';
import 'package:solana/solana.dart';

// Function with 2 params
Future<String> getTokenAddress({
  required String account,
  required String mint,
}) async {
  final address = await findAssociatedTokenAddress(mint: getPublicKey(mint), owner: getPublicKey(account));

  return address.toString();
}
