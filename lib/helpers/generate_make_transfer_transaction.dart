import 'dart:convert';

import 'package:kinetic/constants.dart';
import 'package:kinetic/interfaces/kinetic_sdk_config.dart';
import 'package:kinetic/interfaces/make_transfer_options.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

import 'package:kinetic/generated/lib/api.dart';

Future<Transaction?> generateMakeTransferTransaction(KineticSdkConfig sdkConfig, MakeTransferOptions makeTransferOptions, String mint, int decimals, String feePayer, bool senderCreate, {List fk = const []}) async {

  final hopSignerPublicKey = Ed25519HDPublicKey.fromBase58(feePayer);

  var asa = "";
  var ara = "";

  // SolanaClient solanaClient = SolanaClient(rpcUrl: Uri.parse(sdkConfig.solanaRpcEndpoint), websocketUrl: Uri.parse(sdkConfig.solanaWssEndpoint), timeout: timeoutDuration);

  AccountApi _apiInstance = AccountApi();
  List<String>? senderResult = await _apiInstance.getTokenAccounts(sdkConfig.environment.name, sdkConfig.index, makeTransferOptions.owner.publicKey.toBase58(), makeTransferOptions.mint);
  List<String>? recipientResult = await _apiInstance.getTokenAccounts(sdkConfig.environment.name, sdkConfig.index, makeTransferOptions.destination.toBase58(), makeTransferOptions.mint);

  // var associatedSenderAccount = await solanaClient.getAssociatedTokenAccount(
  //   owner: makeTransferOptions.owner.publicKey,
  //   mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint),
  //   // commitment: Commitment.confirmed,
  // );
  //
  // var associatedRecipientAccount = await solanaClient.getAssociatedTokenAccount(
  //   owner: makeTransferOptions.destination,
  //   mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint),
  //   // commitment: Commitment.confirmed,
  // );

  if (senderResult == null || senderResult.isEmpty) {
    throw NoAssociatedTokenAccountException(makeTransferOptions.owner.address, makeTransferOptions.mint);
  } else {
    asa = senderResult[0];
  }

  List<Ed25519HDPublicKey> signersPublic = [makeTransferOptions.owner.publicKey, hopSignerPublicKey];

  List<Instruction> instructions;

  var createATAInstruction;

  if (recipientResult == null || recipientResult.isEmpty) {
    if (senderCreate == false) {
      throw NoAssociatedTokenAccountException(makeTransferOptions.destination.toBase58(), makeTransferOptions.mint,);
    } else {

      final derivedAddress = await findAssociatedTokenAddress(
        owner: makeTransferOptions.destination,
        mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint),
      );

      ara = derivedAddress.toBase58();

      createATAInstruction = AssociatedTokenAccountInstruction.createAccount(
        funder: hopSignerPublicKey,
        address: derivedAddress,
        owner: makeTransferOptions.destination,
        mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint),
      );

    }
  } else {
    ara = recipientResult[0];
  }

  final transferInstruction = TokenInstruction.transfer(
    source: Ed25519HDPublicKey.fromBase58(asa),
    destination: Ed25519HDPublicKey.fromBase58(ara),
    owner: makeTransferOptions.owner.publicKey,
    amount: getRawQuantity(double.parse(makeTransferOptions.amount), decimals).toInt(),
    signers: signersPublic,
  );

  if (recipientResult == null || recipientResult.isEmpty) {
    instructions = [
      createATAInstruction,
      transferInstruction,
    ];
  } else {
    instructions = [transferInstruction];
  }

  var b = createKinMemoInstruction(makeTransferOptions.type, sdkConfig.index, fk: fk);

  instructions.insert(0, MemoInstruction(signers: [], memo: base64Encode(b)));

  final message = Message(
    instructions: instructions,
  );

  TransactionApi _tApiInstance = TransactionApi();
  LatestBlockhashResponse? latestBlockhashResponse = await _tApiInstance.getLatestBlockhash(sdkConfig.environment.name, sdkConfig.index);

  if (latestBlockhashResponse == null) {
    return null;
  }

  var recentBlockHash = latestBlockhashResponse.blockhash;
  int blockHeight = latestBlockhashResponse.lastValidBlockHeight;

  final CompiledMessage compiledMessage = message.compile(
    recentBlockhash: recentBlockHash,
    feePayer: hopSignerPublicKey,
  );

  var tx = SignedTx(
    messageBytes: compiledMessage.data,
    signatures: [
      Signature(List.filled(64, 0), publicKey: hopSignerPublicKey),
      await makeTransferOptions.owner.sign(compiledMessage.data),
    ],
  );

  String _txe = tx.encode();

  final apiInstance = TransactionApi();

  final makeTransferRequest = MakeTransferRequest(
    commitment: makeTransferOptions.commitment,
    lastValidBlockHeight: blockHeight,
    environment: sdkConfig.environment.name,
    index: sdkConfig.index,
    mint: mint,
    referenceId: makeTransferOptions.referenceId,
    referenceType: makeTransferOptions.referenceType,
    tx: _txe,
  );

  Transaction? transaction;
  try {
    transaction = await apiInstance.makeTransfer(makeTransferRequest);
    safePrint(transaction);
  } catch (e) {
    safePrint('Exception when calling TransactionApi->makeTransfer: $e\n');
  }

  return transaction;
}