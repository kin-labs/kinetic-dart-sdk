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

  SolanaClient solanaClient = SolanaClient(rpcUrl: Uri.parse(sdkConfig.solanaRpcEndpoint), websocketUrl: Uri.parse(sdkConfig.solanaWssEndpoint), timeout: timeoutDuration);

  var associatedSenderAccount = await solanaClient.getAssociatedTokenAccount(
    owner: makeTransferOptions.owner.publicKey,
    mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint),
    // commitment: Commitment.confirmed,
  );

  var associatedRecipientAccount = await solanaClient.getAssociatedTokenAccount(
    owner: makeTransferOptions.destination,
    mint: Ed25519HDPublicKey.fromBase58(makeTransferOptions.mint),
    // commitment: Commitment.confirmed,
  );

  if (associatedSenderAccount == null) {
    throw NoAssociatedTokenAccountException(makeTransferOptions.owner.address, makeTransferOptions.mint);
  } else {
    asa = associatedSenderAccount.pubkey;
  }

  List<Ed25519HDPublicKey> signersPublic = [makeTransferOptions.owner.publicKey, hopSignerPublicKey];

  List<Instruction> instructions;

  var createATAInstruction;

  if (associatedRecipientAccount == null) {
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
    ara = associatedRecipientAccount.pubkey;
  }

  final transferInstruction = TokenInstruction.transfer(
    source: Ed25519HDPublicKey.fromBase58(asa),
    destination: Ed25519HDPublicKey.fromBase58(ara),
    owner: makeTransferOptions.owner.publicKey,
    amount: getRawQuantity(double.parse(makeTransferOptions.amount), decimals).toInt(),
    signers: signersPublic,
  );

  if (associatedRecipientAccount == null) {
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