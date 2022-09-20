import 'dart:convert';

import 'package:kinetic/interfaces/generate_make_transfer_options.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

Future<String> generateMakeTransferTransaction(GenerateMakeTransferOptions options, {List fk = const []}) async {

  final hopSignerPublicKey = Ed25519HDPublicKey.fromBase58(options.mintFeePayer);

  var asa = options.senderATA;
  var ara = "";

  List<Ed25519HDPublicKey> signersPublic = [options.signer.publicKey, hopSignerPublicKey];

  List<Instruction> instructions;

  var createATAInstruction;

  final derivedAddress = await findAssociatedTokenAddress(
    owner: options.destination,
    mint: Ed25519HDPublicKey.fromBase58(options.mintPublicKey),
  );

  ara = derivedAddress.toBase58();

  if (options.senderCreate) {
    createATAInstruction = AssociatedTokenAccountInstruction.createAccount(
      funder: hopSignerPublicKey,
      address: derivedAddress,
      owner: options.destination,
      mint: Ed25519HDPublicKey.fromBase58(options.mintPublicKey),
    );
  }

  final transferInstruction = TokenInstruction.transfer(
    source: Ed25519HDPublicKey.fromBase58(asa),
    destination: Ed25519HDPublicKey.fromBase58(ara),
    owner: options.signer.publicKey,
    amount: getRawQuantity(double.parse(options.amount), options.mintDecimals).toInt(),
    signers: signersPublic,
  );

  if (options.senderCreate) {
    instructions = [
      createATAInstruction,
      transferInstruction,
    ];
  } else {
    instructions = [transferInstruction];
  }

  var b = createKinMemoInstruction(options.type, options.appIndex, fk: fk);

  instructions.insert(0, MemoInstruction(signers: [], memo: base64Encode(b)));

  final message = Message(
    instructions: instructions,
  );

  var recentBlockHash = options.latestBlockhash;
  int blockHeight = options.lastValidBlockHeight;

  final CompiledMessage compiledMessage = message.compile(
    recentBlockhash: recentBlockHash,
    feePayer: hopSignerPublicKey,
  );

  var tx = SignedTx(
    messageBytes: compiledMessage.data,
    signatures: [
      Signature(List.filled(64, 0), publicKey: hopSignerPublicKey),
      await options.signer.sign(compiledMessage.data),
    ],
  );

  String _txe = tx.encode();

  return _txe;
  // final makeTransferRequest = MakeTransferRequest(
  //   commitment: options.c,
  //   lastValidBlockHeight: blockHeight,
  //   environment: sdkConfig.environment.name,
  //   index: sdkConfig.index,
  //   mint: mint,
  //   referenceId: makeTransferOptions.referenceId,
  //   referenceType: makeTransferOptions.referenceType,
  //   tx: _txe,
  // );
  //
  // Transaction? transaction;
  // try {
  //   transaction = await transactionApi.makeTransfer(makeTransferRequest);
  //   safePrint(transaction);
  // } catch (e) {
  //   safePrint('Exception when calling TransactionApi->makeTransfer: $e\n');
  // }
  //
  // return transaction;
}