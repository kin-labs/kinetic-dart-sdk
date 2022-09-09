import 'package:flutter_test/flutter_test.dart';

import 'package:kinetic/kinetic.dart';
import 'package:kinetic/models.dart';
import 'package:kinetic/commitment.dart' as commitment;
import 'package:kinetic/tools.dart';
import 'package:logger/logger.dart';
import 'package:solana/solana.dart';

void main() async {

  test('Get App Config', () async {
    final kinetic = KineticSdk();
    Logger logger = Logger();
    KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
    bool ok = await kinetic.setup(sdkConfig: config);
    if (ok) {
      safePrint(kinetic.appConfig.toString());
    }
    expect(ok, true);
  });

  test('Get Balance', () async {
    final kinetic = KineticSdk();
    Logger logger = Logger();
    KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
    bool ok = await kinetic.setup(sdkConfig: config);
    if (ok) {

      GetBalanceOptions balanceOptions = GetBalanceOptions(account: kinetic.keypair.publicKeyFromString("DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F"));
      dynamic res = await kinetic.getBalance(balanceOptions);
      safePrint(res);
    }
    expect(ok, true);
  });

  test('Get History', () async {
    final kinetic = KineticSdk();

    Logger logger = Logger();
    KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);

    bool ok = await kinetic.setup(sdkConfig: config);
    if (ok) {
      GetHistoryOptions historyOptions = GetHistoryOptions(account: kinetic.keypair.publicKeyFromString("DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F"), mint: kinetic.keypair.publicKeyFromString("KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX"));
      dynamic res = await kinetic.getHistory(historyOptions);
      safePrint(res);
    }
    expect(ok, true);
  });

  test('Get Token Accounts', () async {
    final kinetic = KineticSdk();
    Logger logger = Logger();
    KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
    bool ok = await kinetic.setup(sdkConfig: config);
    if (ok) {
      GetTokenAccountsOptions accountOptions = GetTokenAccountsOptions(account: kinetic.keypair.publicKeyFromString("DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F"), mint: kinetic.keypair.publicKeyFromString("KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX"));
      dynamic res = await kinetic.getTokenAccounts(accountOptions);
      safePrint(res);
    }
    expect(ok, true);
  });

  test('Request Airdrop', () async {
    final kinetic = KineticSdk();
    Logger logger = Logger();
    KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
    bool ok = await kinetic.setup(sdkConfig: config);
    if (ok) {
      RequestAirdropOptions airdropOptions = RequestAirdropOptions(account: kinetic.keypair.publicKeyFromString("DUXaDD5FZDa9yFf83tP8Abb6z66ECiawRShejSXRMN5F"), mint: kinetic.keypair.publicKeyFromString("KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX"), amount: "10", commitment: commitment.Commitment.Finalized);
      dynamic res = await kinetic.requestAirdrop(airdropOptions);
      safePrint(res);
    }
    expect(ok, true);
  });

  test('makeTransfer', () async {
    final kinetic = KineticSdk();
    Logger logger = Logger();
    KineticSdkConfig config = KineticSdkConfig(index: 1, environment: KineticSdkEnvironment.devnet, logger: logger);
    bool ok = await kinetic.setup(sdkConfig: config);
    if (ok) {
      final from = await Ed25519HDKeyPair.fromPrivateKeyBytes(
        privateKey: [230, 245, 154, 108, 75, 133, 168, 61, 98, 99, 138, 19, 150, 122, 171, 162, 56, 101, 142, 67, 229, 255, 240, 158, 249, 113, 155, 58, 155, 128, 209, 10],
      );

      safePrint("From: ${from.publicKey.toBase58()}");
      safePrint("To: AVGAggsdHmubCZLmJ94dRp98kGJu1ZsFENPTNSe3Nhfw");

      MakeTransferOptions makeTransferOptions = MakeTransferOptions(amount: "1.0", destination: kinetic.keypair.publicKeyFromString("AVGAggsdHmubCZLmJ94dRp98kGJu1ZsFENPTNSe3Nhfw"), commitment: commitment.Commitment.Finalized, mint: "KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX", owner: from, referenceId: "p2p", referenceType: "tx", type: TransactionType.p2p);
      dynamic res = await kinetic.makeTransfer(makeTransferOptions: makeTransferOptions, senderCreate: true);

      safePrint(res);
    }
    expect(ok, true);
  }, timeout: const Timeout(Duration(minutes: 10)), );

}
