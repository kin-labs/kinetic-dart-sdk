import 'dart:convert';

import 'package:kinetic/tools.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

import 'generated/api.dart';
import 'http.dart';
import 'models.dart';

class KineticSdkInternal {

  Future<Map<String, dynamic>> getAppConfigImpl(KineticSdkConfig sdkConfig) async {
    String _url = "${sdkConfig.endpoint}/api/app/${sdkConfig.environment.name}/${sdkConfig.index}/config";
    Map<String, dynamic> httpResponse = await httpGetRequest(_url);
    return httpResponse;
  }

  Future<Map<String, dynamic>> getBalanceImpl(KineticSdkConfig sdkConfig, String accountId) async {
    String _url = "${sdkConfig.endpoint}/api/account/balance/${sdkConfig.environment.name}/${sdkConfig.index}/$accountId";
    Map<String, dynamic> httpResponse = await httpGetRequest(_url);
    return httpResponse;
  }

  Future<Map<String, dynamic>> getHistoryImpl(KineticSdkConfig sdkConfig, String accountId, String mint) async {
    String _url = "${sdkConfig.endpoint}/api/account/history/${sdkConfig.environment.name}/${sdkConfig.index}/$accountId/$mint";
    Map<String, dynamic> httpResponse = await httpGetRequest(_url);
    return httpResponse;
  }

  Future<Map<String, dynamic>> getTokenAccountsImpl(KineticSdkConfig sdkConfig, String accountId, String mint) async {
    String _url = "${sdkConfig.endpoint}/api/account/token-accounts/${sdkConfig.environment.name}/${sdkConfig.index}/$accountId/$mint";
    Map<String, dynamic> httpResponse = await httpGetRequest(_url);
    return httpResponse;
  }

  Future<AppTransaction?> makeTransferImpl(Map<String, dynamic> appConfig, KineticSdkConfig sdkConfig, SolanaClient solanaClient, bool senderCreate, MakeTransferOptions makeTransferOptions, {List fk = const []}) async {

    checkDestination(appConfig, makeTransferOptions.destination.toBase58());
    String feePayer = getFeePayer(appConfig, makeTransferOptions.mint);
    int decimals = getDecimals(appConfig, makeTransferOptions.mint);

    final hopSignerPublicKey = Ed25519HDPublicKey.fromBase58(feePayer);

    var asa = "";
    var ara = "";

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

    safePrint("From: ${makeTransferOptions.owner.publicKey.toBase58()}");
    safePrint("To: ${makeTransferOptions.destination.toBase58()}");

    AppTransaction? appTransaction = await generateMakeTransferTransaction(sdkConfig, makeTransferOptions, _txe, makeTransferOptions.mint, blockHeight);

    return appTransaction;
  }

  Future<Map<String, dynamic>> createAccountImpl(Map<String, dynamic> appConfig, KineticSdkConfig sdkConfig, SolanaClient solanaClient, String mint, Ed25519HDKeyPair from) async {

    String feePayer = getFeePayer(appConfig, mint);

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

    Map<String, dynamic> httpResponse = await postCreateATATransaction(sdkConfig, _txe, mint, blockHeight);
    httpResponse["derivedAddress"] = derivedAddress;

    return httpResponse;
  }

  Future<Map<String, dynamic>> postRequestAirdropImpl(KineticSdkConfig sdkConfig, String accountId, String mint, double amount) async {
    String _url = "${sdkConfig.endpoint}/api/airdrop/";

    Map<String, dynamic> dataMap = {
      ...sdkConfig.headers,
      "account":accountId,
      "amount":amount.toString(),
      "commitment":"confirmed",
      "environment":sdkConfig.environment.name,
      "index":sdkConfig.index,
      "mint":mint,
    };

    Map<String, dynamic> httpResponse = await httpPostRequest(_url, jsonEncode(dataMap));
    return httpResponse;
  }

  Future<Map<String, dynamic>> postCreateATATransaction(KineticSdkConfig sdkConfig, String _txe, String mint, int lastValidBlockHeight) async {
    String _url = "${sdkConfig.endpoint}/api/account/create/";

    Map<String, dynamic> dataMap = {
      ...sdkConfig.headers,
      "environment":sdkConfig.environment.name,
      "index":sdkConfig.index,
      "mint":mint,
      "tx":_txe,
    };

    Map<String, dynamic> httpResponse = await httpPostRequest(_url, jsonEncode(dataMap));
    return httpResponse;
  }

  Future<AppTransaction?> generateMakeTransferTransaction(KineticSdkConfig sdkConfig, MakeTransferOptions makeTransferOptions, String _txe, String mint, int lastValidBlockHeight) async {
    String _url = "${sdkConfig.endpoint}/api/transaction/make-transfer/";

    final apiInstance = TransactionApi();
    final makeTransferRequest = MakeTransferRequest(
      commitment: MakeTransferRequestCommitmentEnum.confirmed,
      lastValidBlockHeight: lastValidBlockHeight,
      environment: sdkConfig.environment.name,
      index: sdkConfig.index,
      mint: mint,
      referenceId: makeTransferOptions.referenceId,
      referenceType: makeTransferOptions.referenceType,
      tx: _txe,
    ); // MakeTransferRequest |

    AppTransaction? appTransaction;
    try {
      appTransaction = await apiInstance.makeTransfer(makeTransferRequest);
      safePrint(appTransaction);
    } catch (e) {
      safePrint('Exception when calling TransactionApi->makeTransfer: $e\n');
    }

    return appTransaction;

    // Map<String, dynamic> dataMap = {
    //   ...sdkConfig.headers,
    //   "commitment":makeTransferOptions.commitment.name,
    //   "environment":sdkConfig.environment.name,
    //   "index":sdkConfig.index,
    //   "mint":makeTransferOptions.mint,
    //   "lastValidBlockHeight":lastValidBlockHeight,
    //   "referenceId":makeTransferOptions.referenceId,
    //   "referenceType":makeTransferOptions.referenceType,
    //   "tx":_txe,
    // };
    //
    // Map<String, dynamic> httpResponse = await httpPostRequest(_url, jsonEncode(dataMap));
    // return httpResponse;
  }

}

