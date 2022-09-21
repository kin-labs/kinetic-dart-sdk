import 'dart:convert';

import 'package:kinetic/helpers/get_public_key.dart';
import 'package:kinetic/interfaces/generate_create_account_options.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

Future<SignedTx> generateCreateAccountTransaction(GenerateCreateAccountOptions options, {List fk = const []}) async {
  // Create objects from Response
  final feePayerKey = getPublicKey(options.mintFeePayer);
  final mintKey = getPublicKey(options.mintPublicKey);
  final ownerPublicKey = options.owner.solanaPublicKey;

  // Get TokenAccount from Owner and Destination
  final ownerTokenAccount = await findAssociatedTokenAddress(mint: mintKey, owner: ownerPublicKey);

  // Create Instructions
  List<Instruction> instructions = [];

  if (options.addMemo) {
    var memo = createKinMemoInstruction(TransactionType.none, options.index);
    instructions.add(MemoInstruction(signers: [], memo: base64Encode(memo)));
  }

  instructions.add(AssociatedTokenAccountInstruction.createAccount(
    funder: feePayerKey,
    address: ownerTokenAccount,
    owner: ownerPublicKey,
    mint: mintKey,
  ));

  instructions.add(TokenInstruction.setAuthority(
    mintOrAccount: ownerTokenAccount,
    authorityType: AuthorityType.closeAccount,
    currentAuthority: ownerPublicKey,
    newAuthority: feePayerKey,
    signers: [ownerPublicKey, feePayerKey],
  ));

  final CompiledMessage message = Message(instructions: instructions).compile(
    recentBlockhash: options.blockhash,
    feePayer: feePayerKey,
  );

  return SignedTx(
    messageBytes: message.data,
    signatures: [
      Signature(List.filled(64, 0), publicKey: feePayerKey),
      await options.owner.solana.sign(message.data),
    ],
  );
}
