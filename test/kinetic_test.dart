import 'package:flutter_test/flutter_test.dart';
import 'package:kinetic/commitment.dart';
import 'package:kinetic/generated/lib/api.dart';

import 'package:kinetic/kinetic_sdk.dart';
import 'package:kinetic/models.dart';
import 'package:kinetic/tools.dart';
import 'package:logger/logger.dart';

void main() async {

  // test('Get App Config', () async {
  //   final kinetic = KineticSdk();
  //   Logger logger = Logger();
  //   await setupIdentifiers();
  //   KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);

  //   bool ok = await kinetic.setup(sdkConfig: config);
  //   if (ok) {
  //     safePrint(kinetic.appConfig.toString());
  //   }
  //   expect(ok, true);
  // });

  // test('Get Balance', () async {
  //   final kinetic = KineticSdk();
  //   Logger logger = Logger();
  //   await setupIdentifiers();
  //   KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
  //
  //   bool ok = await kinetic.setup(sdkConfig: config);
  //   if (ok) {
  //
  //     GetBalanceOptions balanceOptions = GetBalanceOptions(account: kinetic.keypair.publicKeyFromString("DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F"));
  //     dynamic res = await kinetic.getBalance(balanceOptions);
  //     safePrint(res);
  //   }
  //   expect(ok, true);
  // });

  // test('Get History', () async {
  //   final kinetic = KineticSdk();
  //   Logger logger = Logger();
  //   await setupIdentifiers();
  //   KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
  //
  //   bool ok = await kinetic.setup(sdkConfig: config);
  //   if (ok) {
  //     GetHistoryOptions historyOptions = GetHistoryOptions(account: kinetic.keypair.publicKeyFromString("DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F"), mint: kinetic.keypair.publicKeyFromString("KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX"));
  //     dynamic res = await kinetic.getHistory(historyOptions);
  //     safePrint(res);
  //   }
  //   expect(ok, true);
  // });

  // test('Get Token Accounts', () async {
  //     final kinetic = KineticSdk();
  //     Logger logger = Logger();
  //     await setupIdentifiers();
  //     KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
  //
  //     bool ok = await kinetic.setup(sdkConfig: config);
  //   if (ok) {
  //     GetTokenAccountsOptions accountOptions = GetTokenAccountsOptions(account: kinetic.keypair.publicKeyFromString("DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F"), mint: kinetic.keypair.publicKeyFromString("KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX"));
  //     dynamic res = await kinetic.getTokenAccounts(accountOptions);
  //     safePrint(res);
  //   }
  //   expect(ok, true);
  // });

  // test('Request Airdrop', () async {
  //   final kinetic = KineticSdk();
  //   Logger logger = Logger();
  //   await setupIdentifiers();
  //   KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
  //
  //   bool ok = await kinetic.setup(sdkConfig: config);
  //   if (ok) {
  //     RequestAirdropRequest airdropRequest = RequestAirdropRequest(account: "DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F", mint: "KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX", amount: "10", commitment: RequestAirdropRequestCommitmentEnum.finalized, index: kinetic.sdkConfig.index, environment: 'devnet');
  //     dynamic res = await kinetic.requestAirdrop(airdropRequest);
  //     safePrint(res);
  //   }
  //   expect(ok, true);
  // });

  // test('makeTransfer', () async {
  //   final kinetic = KineticSdk();
  //   Logger logger = Logger();
  //   await setupIdentifiers();
  //   KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
  //
  //   bool ok = await kinetic.setup(sdkConfig: config);
  //   if (ok) {
  //     final from = await kinetic.keypair.fromByteArray([230, 245, 154, 108, 75, 133, 168, 61, 98, 99, 138, 19, 150, 122, 171, 162, 56, 101, 142, 67, 229, 255, 240, 158, 249, 113, 155, 58, 155, 128, 209, 10]);
  //     // final from = await Ed25519HDKeyPair.fromPrivateKeyBytes(
  //     //   privateKey: [230, 245, 154, 108, 75, 133, 168, 61, 98, 99, 138, 19, 150, 122, 171, 162, 56, 101, 142, 67, 229, 255, 240, 158, 249, 113, 155, 58, 155, 128, 209, 10],
  //     // );
  //
  //     safePrint("From: ${from.publicKey.toBase58()}");
  //     safePrint("To: AVGAggsdHmubCZLmJ94dRp98kGJu1ZsFENPTNSe3Nhfw");
  //
  //     MakeTransferOptions makeTransferOptions = MakeTransferOptions(amount: "1.0", destination: kinetic.keypair.publicKeyFromString("AVGAggsdHmubCZLmJ94dRp98kGJu1ZsFENPTNSe3Nhfw"), commitment: MakeTransferRequestCommitmentEnum.finalized, mint: "KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX", owner: from, referenceId: "p2p", referenceType: "tx", type: TransactionType.p2p);
  //     Transaction? transaction = await kinetic.makeTransfer(makeTransferOptions: makeTransferOptions, senderCreate: true);
  //
  //     safePrint(transaction?.toJson());
  //   }
  //   expect(ok, true);
  // }, timeout: const Timeout(Duration(minutes: 10)), );

  test('createAccount', () async {
    final kinetic = KineticSdk();
    Logger logger = Logger();
    await setupIdentifiers();
    KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);

    bool ok = await kinetic.setup(sdkConfig: config);
    if (ok) {
      final from = await kinetic.keypair.random();
      CreateAccountOptions createAccountOptions = CreateAccountOptions(owner: from, mint: "KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX", commitment: Commitment.Finalized);
      Transaction? transaction = await kinetic.createAccount(createAccountOptions: createAccountOptions);

      safePrint(transaction?.toJson());
    }
    expect(ok, true);
  }, timeout: const Timeout(Duration(minutes: 10)), );

}
