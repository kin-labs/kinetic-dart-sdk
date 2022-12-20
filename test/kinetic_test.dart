// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/interfaces/close_account_options.dart';
import 'package:kinetic/interfaces/create_account_options.dart';
import 'package:kinetic/interfaces/get_account_info_options.dart';
import 'package:kinetic/interfaces/get_balance_options.dart';
import 'package:kinetic/interfaces/get_history_options.dart';
import 'package:kinetic/interfaces/get_token_accounts_options.dart';
import 'package:kinetic/interfaces/get_transaction_options.dart';
import 'package:kinetic/interfaces/kinetic_sdk_config.dart';
import 'package:kinetic/interfaces/make_transfer_options.dart';
import 'package:kinetic/interfaces/request_airdrop_options.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/keypair.dart';
import 'package:kinetic/kinetic_sdk.dart';
import 'package:kinetic/tools.dart';
import 'package:logger/logger.dart';

import 'fixtures.dart';

KineticSdkConfig sdkConfig = KineticSdkConfig(
  endpoint: 'http://localhost:3000',
  environment: 'local',
  index: 1,
  logger: Logger(),
);

String accountAlice = "ALisrzsaVqciCxy8r6g7MUrPoRo3CpGxPhwBbZzqZ9bA";
String aliceTokenAccount = "Ebq6K7xVh6PYQ8DrTQnD9fC91uQiyBMPGSV6JCG6GPdD";
String accountBob = "BobQoPqWy5cpFioy1dMTYqNH9WpC39mkAEDJWXECoJ9y";
String defaultMint = "MoGaMuJnB3k8zXjBYBnHxHG47vWcW3nyb7bFYvdVzek";
// String defaultMint = "KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX";

void main() async {
  test('Get App Config', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);

    if (sdk.config == null) {
      throw Exception('App config is null');
    }
    safePrint(sdk.config.toString());
    expect(sdk.config, const TypeMatcher<AppConfig>());
  });

  test('Get Balance', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);

    GetBalanceOptions options = GetBalanceOptions(account: accountAlice);
    BalanceResponse? res = await sdk.getBalance(options);
    if (res == null) {
      print("Error getting balance");
      throw Exception("Error getting balance");
    }
    safePrint(res);
    expect(res, const TypeMatcher<BalanceResponse>());
    expect(double.parse(res.balance), greaterThan(50000));
    expect(res.balance, const TypeMatcher<String>());
    expect(res.tokens, const TypeMatcher<List<BalanceToken>>());
    expect(res.mints, const TypeMatcher<Object>());
  });

  test('Get History', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);

    GetHistoryOptions options = GetHistoryOptions(account: accountAlice, mint: defaultMint);
    List<HistoryResponse>? res = await sdk.getHistory(options);
    if (res == null) {
      print("Error getting history");
      throw Exception("Error getting history");
    }
    safePrint(res);

    expect(res, const TypeMatcher<List<HistoryResponse>>());
    expect(res.length, greaterThan(0));
    expect(res[0].history, const TypeMatcher<List<ConfirmedSignatureInfo>>());
    expect(res[0].account, const TypeMatcher<String>());
  });

  test('Get Token Accounts', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);

    GetTokenAccountsOptions options = GetTokenAccountsOptions(account: accountAlice, mint: defaultMint);
    List<String>? res = await sdk.getTokenAccounts(options);
    if (res == null) {
      print("Error requesting token accounts");
      throw Exception("Error requesting token accounts");
    }
    safePrint(res);

    expect(res, const TypeMatcher<List<String>>());
    expect(res.length, greaterThan(0));
  });

  test('Request Airdrop', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);

    RequestAirdropOptions options = RequestAirdropOptions(
      account: accountAlice,
      mint: defaultMint,
      amount: "10",
      commitment: Commitment.finalized,
    );
    RequestAirdropResponse? res = await sdk.requestAirdrop(options);
    if (res == null) {
      print("Error requesting airdrop");
      throw Exception("Error requesting airdrop");
    }
    safePrint(res);

    expect(res, const TypeMatcher<RequestAirdropResponse>());
  });

  test(
    'makeTransfer',
    () async {
      KineticSdk sdk = await KineticSdk.setup(sdkConfig);

      Keypair owner = await getAliceKeypair();

      safePrint("From: ${owner.publicKey}");
      safePrint("To: $accountBob");

      MakeTransferOptions options = MakeTransferOptions(
        amount: "1.00005",
        destination: accountBob,
        commitment: Commitment.finalized,
        mint: defaultMint,
        owner: owner,
        referenceId: "our-ref-id",
        referenceType: "some-tx",
        type: TransactionType.p2p,
        senderCreate: false,
      );

      Transaction? transaction = await sdk.makeTransfer(options);
      if (transaction == null) {
        print("Error making transfer");
        throw Exception("Error making transfer");
      }
      safePrint(transaction);

      expect(transaction, const TypeMatcher<Transaction>());
      expect(transaction.signature?.isNotEmpty, true);
      expect(transaction.amount, '1.00005');
      expect(transaction.decimals, 5);
    },
    timeout: const Timeout(Duration(minutes: 10)),
  );

  test(
    'createAccount',
    () async {
      KineticSdk sdk = await KineticSdk.setup(sdkConfig);

      final owner = await Keypair.random();

      CreateAccountOptions options = CreateAccountOptions(
        owner: owner,
        mint: defaultMint,
        commitment: Commitment.finalized,
        referenceId: 'dart',
        referenceType: 'test',
      );

      Transaction? transaction = await sdk.createAccount(options);

      if (transaction == null) {
        print("Error creating account");
        throw Exception("Error creating account");
      }

      safePrint(transaction.toJson());

      expect(transaction, const TypeMatcher<Transaction>());
      expect(transaction.signature?.isNotEmpty, true);
      expect(transaction.source_, owner.publicKey.toString());
    },
    timeout: const Timeout(Duration(minutes: 10)),
  );

  test('getTransaction', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);
    Keypair owner = await getAliceKeypair();

    MakeTransferOptions options = MakeTransferOptions(
      amount: "1.0",
      destination: accountBob,
      commitment: Commitment.finalized,
      mint: defaultMint,
      owner: owner,
    );

    Transaction? transaction = await sdk.makeTransfer(options);
    if (transaction == null) {
      print("Error making transfer for getTransaction");
      throw Exception("Error making transfer for getTransaction");
    }

    GetTransactionResponse? res = await sdk.getTransaction(GetTransactionOptions(signature: transaction.signature!));

    if (res == null) {
      print("Error getting transaction");
      throw Exception("Error getting transaction");
    }
    expect(res, const TypeMatcher<GetTransactionResponse>());
    expect(res.signature, transaction.signature);
  });

  test('getAccountInfo: should get account info', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);

    AccountInfo? res = await sdk.getAccountInfo(GetAccountInfoOptions(account: accountAlice));

    if (res == null) {
      print("Error getting account info");
      throw Exception("Error getting account info");
    }

    expect(res.account, accountAlice);
    expect(res.isMint, false);
    expect(res.isOwner, true);
    expect(res.isTokenAccount, false);
    expect(res.tokens?.length, 1);
    expect(res.tokens?[0].account, aliceTokenAccount);
    expect(res.tokens?[0].decimals, 5);
    expect(res.tokens?[0].mint, defaultMint);
    expect(res.tokens?[0].owner, accountAlice);
  });

  test('closeAccount: should close an account', () async {
    KineticSdk sdk = await KineticSdk.setup(sdkConfig);
    final owner = await Keypair.random();

    Transaction? createTx = await sdk.createAccount(CreateAccountOptions(
      owner: owner,
      commitment: Commitment.finalized,
    ));

    if (createTx == null) {
      print("Error creating account");
      throw Exception("Error creating account");
    }
    expect(createTx, const TypeMatcher<Transaction>());
    expect(createTx.signature?.isNotEmpty, true);

    Transaction? closeTx = await sdk.closeAccount(CloseAccountOptions(
      account: owner.publicKey,
      commitment: Commitment.finalized,
    ));
    if (closeTx == null) {
      print("Error closing account");
      throw Exception("Error closing account");
    }
    expect(closeTx, const TypeMatcher<Transaction>());
    expect(closeTx.signature?.isNotEmpty, true);
    expect(closeTx.errors, []);
  }, timeout: const Timeout(Duration(minutes: 1)));
}
