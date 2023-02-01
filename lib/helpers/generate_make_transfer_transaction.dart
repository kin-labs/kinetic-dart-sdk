import 'dart:convert';

import 'package:kinetic/helpers/get_public_key.dart';
import 'package:kinetic/interfaces/generate_make_transfer_options.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

Future<SignedTx> generateMakeTransferTransaction(GenerateMakeTransferOptions options) async {
  // Create objects from Response
  final destinationPublicKey = getPublicKey(options.destination);
  final destinationTokenAccountPublicKey = getPublicKey(options.destinationTokenAccount);
  final feePayerKey = getPublicKey(options.mintFeePayer);
  final mintKey = getPublicKey(options.mintPublicKey);
  final ownerPublicKey = options.owner.solanaPublicKey;
  final ownerTokenAccountPublicKey = getPublicKey(options.ownerTokenAccount);

  // Create Instructions
  List<Instruction> instructions = [];

  // Create the Memo Instruction
  if (options.addMemo) {
    var memo = createKinMemoInstruction(options.type, options.index);
    instructions.add(MemoInstruction(signers: [], memo: base64Encode(memo)));
  }

  // Create the Token Account if senderCreate is enabled
  if (options.senderCreate != null && options.senderCreate!) {
    instructions.add(AssociatedTokenAccountInstruction.createAccount(
      address: destinationTokenAccountPublicKey,
      funder: feePayerKey,
      mint: mintKey,
      owner: destinationPublicKey,
    ));
  }

  // Create the Token Transfer Instruction
  instructions.add(TokenInstruction.transferChecked(
    decimals: options.mintDecimals,
    mint: mintKey,
    source: ownerTokenAccountPublicKey,
    destination: destinationTokenAccountPublicKey,
    owner: ownerPublicKey,
    amount: getRawQuantity(double.parse(options.amount), options.mintDecimals).toInt(),
    signers: [ownerPublicKey, feePayerKey],
  ));

  // Create transaction
  final CompiledMessage message = Message(instructions: instructions).compile(
    recentBlockhash: options.blockhash,
    feePayer: feePayerKey,
  );

  // Partially sign the transaction
  return SignedTx(
    messageBytes: message.data,
    signatures: [
      Signature(List.filled(64, 0), publicKey: feePayerKey),
      await options.owner.solana.sign(message.data),
    ],
  );
}
