import 'dart:convert';

import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/models.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

Future<Transaction?> generateCreateAccountTransaction(SolanaClient solanaClient, KineticSdkConfig sdkConfig, String mint, Ed25519HDKeyPair from, String feePayer, {List fk = const []}) async {

  final hopSignerPublicKey = Ed25519HDPublicKey.fromBase58(feePayer);

  final derivedAddress = await findAssociatedTokenAddress(
    owner: from.publicKey,
    mint: Ed25519HDPublicKey.fromBase58(mint),
  );

  List<Ed25519HDPublicKey> signersPublic = [from.publicKey, hopSignerPublicKey];

  final createATAInstruction = AssociatedTokenAccountInstruction.createAccount(
    funder: hopSignerPublicKey,
    address: derivedAddress,
    owner: from.publicKey,
    mint: Ed25519HDPublicKey.fromBase58(mint),
  );

  final authorityInstruction = TokenInstruction.setAuthority(
    mintOrAccount: derivedAddress,
    authorityType: AuthorityType.closeAccount,
    currentAuthority: from.publicKey,
    newAuthority: hopSignerPublicKey,
    signers: signersPublic,
  );

  var b = createKinMemoInstruction(TransactionType.none, sdkConfig.index);

  final message = Message(
    instructions: [
      MemoInstruction(signers: [], memo: base64Encode(b)),
      createATAInstruction,
      authorityInstruction,
    ],
  );

  var recentBlockHash = await solanaClient.rpcClient.getRecentBlockhash();
  int blockHeight = await solanaClient.rpcClient.getBlockHeight();

  final CompiledMessage compiledMessage = message.compile(
    recentBlockhash: recentBlockHash.blockhash,
    feePayer: hopSignerPublicKey,
  );

  var tx = SignedTx(
    messageBytes: compiledMessage.data,
    signatures: [
      Signature(List.filled(64, 0), publicKey: hopSignerPublicKey),
      await from.sign(compiledMessage.data),
    ],
  );

  String _txe = tx.encode();

  final apiInstance = AccountApi();

  final createAccountRequest = CreateAccountRequest(
    environment: sdkConfig.environment.name,
    index: sdkConfig.index,
    mint: mint,
    tx: _txe,
  );

  Transaction? transaction;
  try {
    transaction = await apiInstance.createAccount(createAccountRequest);
    safePrint(transaction);
  } catch (e) {
    safePrint('Exception when calling AccountApi->createAccount: $e\n');
  }

  return transaction;

  // Map<String, dynamic> httpResponse = await postCreateATATransaction(sdkConfig, _txe, mint, blockHeight);
  // httpResponse["derivedAddress"] = derivedAddress;
  //
  // return httpResponse;
}