import 'dart:convert';

import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

import '../interfaces/generate_create_account_options.dart';

Future<SignedTx> generateCreateAccountTransaction(GenerateCreateAccountOptions options, {List fk = const []}) async {
  // Create objects from Response
  final feePayerKey = Ed25519HDPublicKey.fromBase58(options.mintFeePayer);
  final mintKey = Ed25519HDPublicKey.fromBase58(options.mintPublicKey);
  final ownerPublicKey = options.signer.publicKey;

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
      await options.signer.sign(message.data),
    ],
  );
}
