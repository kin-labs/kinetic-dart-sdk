/// This method accepts one of the existing clusterApiUrls of the URL of a Solana RPC Node.
String getSolanaRpcEndpoint(String endpoint) {
  switch (endpoint) {
    case 'devnet':
      return 'https://api.devnet.solana.com';
    case 'mainnet':
    case 'mainnet-beta':
      return 'https://api.mainnet-beta.solana.com';
    default:
      if (endpoint.startsWith('http')) {
        return endpoint;
      }
      throw Exception('Unknown http or https endpoint');
  }
}
