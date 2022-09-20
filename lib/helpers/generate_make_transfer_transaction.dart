import 'dart:convert';

import 'package:kinetic/interfaces/generate_make_transfer_options.dart';
import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

Future<String> generateMakeTransferTransaction(GenerateMakeTransferOptions options, {List fk = const []}) async {
  final hopSignerPublicKey = Ed25519HDPublicKey.fromBase58(options.mintFeePayer);

  List<Ed25519HDPublicKey> signersPublic = [options.signer.publicKey, hopSignerPublicKey];

  List<Instruction> instructions;

  var createATAInstruction;

  final derivedAddress = await findAssociatedTokenAddress(
    owner: Ed25519HDPublicKey.fromBase58(options.destination),
    mint: Ed25519HDPublicKey.fromBase58(options.mintPublicKey),
  );

  var ara = derivedAddress.toBase58();

  // Check if options.senderCreate is not null and true
  if (options.senderCreate != null && options.senderCreate!) {
    createATAInstruction = AssociatedTokenAccountInstruction.createAccount(
      funder: hopSignerPublicKey,
      address: derivedAddress,
      owner: Ed25519HDPublicKey.fromBase58(options.destination),
      mint: Ed25519HDPublicKey.fromBase58(options.mintPublicKey),
    );
  }

  final transferInstruction = TokenInstruction.transfer(
    source: Ed25519HDPublicKey.fromBase58(options.ownerTokenAccount),
    destination: Ed25519HDPublicKey.fromBase58(ara),
    owner: options.signer.publicKey,
    amount: getRawQuantity(double.parse(options.amount), options.mintDecimals).toInt(),
    signers: signersPublic,
  );

  if (options.senderCreate != null && options.senderCreate!) {
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
  int lastValidBlockHeight = options.lastValidBlockHeight;

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
}
