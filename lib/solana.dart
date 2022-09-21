import 'package:solana/solana.dart';

class Solana {
  late SolanaClient client;

  Solana(
      {required String solanaRpcEndpoint,
      String? solanaWssEndpoint,
      Duration timeoutDuration = const Duration(seconds: 60)}) {
    solanaWssEndpoint = solanaWssEndpoint ?? solanaRpcEndpoint.replaceAll('http', 'ws');
    client = SolanaClient(
        rpcUrl: Uri.parse(solanaRpcEndpoint), websocketUrl: Uri.parse(solanaWssEndpoint), timeout: timeoutDuration);
  }
}
