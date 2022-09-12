import 'package:solana/solana.dart';

class Solana {
  late SolanaClient client;

  Solana({required String solanaRpcEndpoint, required String solanaWssEndpoint, required Duration timeoutDuration}) {
    client = SolanaClient(rpcUrl: Uri.parse(solanaRpcEndpoint), websocketUrl: Uri.parse(solanaWssEndpoint), timeout: timeoutDuration);
  }

}