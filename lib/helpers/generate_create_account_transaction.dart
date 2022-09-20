import 'dart:convert';

import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

Future<String> generateCreateAccountTransaction(int appIndex, String latestBlockhash, String mint, Ed25519HDKeyPair owner, String mintFeePayer, {List fk = const []}) async {

  final hopSignerPublicKey = Ed25519HDPublicKey.fromBase58(mintFeePayer);

  final derivedAddress = await findAssociatedTokenAddress(
    owner: owner.publicKey,
    mint: Ed25519HDPublicKey.fromBase58(mint),
  );

  List<Ed25519HDPublicKey> signersPublic = [owner.publicKey, hopSignerPublicKey];

  final createATAInstruction = AssociatedTokenAccountInstruction.createAccount(
    funder: hopSignerPublicKey,
    address: derivedAddress,
    owner: owner.publicKey,
    mint: Ed25519HDPublicKey.fromBase58(mint),
  );

  final authorityInstruction = TokenInstruction.setAuthority(
    mintOrAccount: derivedAddress,
    authorityType: AuthorityType.closeAccount,
    currentAuthority: owner.publicKey,
    newAuthority: hopSignerPublicKey,
    signers: signersPublic,
  );

  var b = createKinMemoInstruction(TransactionType.none, appIndex);

  final message = Message(
    instructions: [
      MemoInstruction(signers: [], memo: base64Encode(b)),
      createATAInstruction,
      authorityInstruction,
    ],
  );

  final CompiledMessage compiledMessage = message.compile(
    recentBlockhash: latestBlockhash,
    feePayer: hopSignerPublicKey,
  );

  var tx = SignedTx(
    messageBytes: compiledMessage.data,
    signatures: [
      Signature(List.filled(64, 0), publicKey: hopSignerPublicKey),
      await owner.sign(compiledMessage.data),
    ],
  );

  String _txe = tx.encode();

  // Below should be moved back into createAccount()
  //
  // final createAccountRequest = CreateAccountRequest(
  //   environment: sdkConfig.environment.name,
  //   index: appIndex,
  //   mint: mint,
  //   referenceId: "DART",
  //   referenceType: "createAccount",
  //   tx: _txe,
  //   commitment: CreateAccountRequestCommitmentEnum.finalized,
  //   lastValidBlockHeight: latestBlockhashResponse.lastValidBlockHeight,
  // );
  //
  // Transaction? transaction;
  // try {
  //   transaction = await accountApi.createAccount(createAccountRequest);
  //   safePrint(transaction);
  // } catch (e) {
  //   safePrint('Exception when calling AccountApi->createAccount: $e\n');
  // }
  //
  // return transaction;

  return _txe;
}