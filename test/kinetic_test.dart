import 'package:flutter_test/flutter_test.dart';
import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/interfaces/get_balance_options.dart';
import 'package:kinetic/interfaces/get_history_options.dart';
import 'package:kinetic/interfaces/get_token_accounts_options.dart';
import 'package:kinetic/interfaces/kinetic_sdk_config.dart';
import 'package:kinetic/interfaces/make_transfer_options.dart';
import 'package:kinetic/interfaces/request_airdrop_options.dart';
import 'package:kinetic/interfaces/transaction_type.dart';
import 'package:kinetic/keypair.dart';
import 'package:kinetic/kinetic_sdk.dart';
import 'package:kinetic/tools.dart';

KineticSdkConfig defaultConfig = KineticSdkConfig(
  index: 1,
  endpoint: 'http://localhost:3000',
  // endpoint: 'https://sandbox.kinetic.host',
  environment: 'devnet',
);

String account = "ALisrzsaVqciCxy8r6g7MUrPoRo3CpGxPhwBbZzqZ9bA";
String tokenAccount = "2buHAucDpb3gECUNZwZQpfAJ8hELsvaQrByYBekT7NKk";
String mint = "MoGaMuJnB3k8zXjBYBnHxHG47vWcW3nyb7bFYvdVzek";
// String mint = "KinDesK3dYWo3R2wDk6Ucaf31tvQCCSYyL8Fuqp33GX";

void main() async {
  test('Get App Config', () async {
    var sdk = await KineticSdk.setup(sdkConfig: defaultConfig);

    if (sdk.config == null) {
      throw Exception('App config is null');
    }
    safePrint(sdk.config.toString());
    expect(sdk.config, const TypeMatcher<AppConfig>());
  });

  test('Get Balance', () async {
    var sdk = await KineticSdk.setup(sdkConfig: defaultConfig);

    GetBalanceOptions options = GetBalanceOptions(account: account);
    BalanceResponse? res = await sdk.getBalance(options: options);
    if (res == null) {
      print("Error getting balance");
      throw Exception("Error getting balance");
    }
    safePrint(res);
    expect(res, const TypeMatcher<BalanceResponse>());
    expect(int.parse(res.balance), greaterThan(50000));
    expect(res.balance, const TypeMatcher<String>());
    expect(res.tokens, const TypeMatcher<List<BalanceToken>>());
    expect(res.mints, const TypeMatcher<Object>());
  });

  test('Get History', () async {
    var sdk = await KineticSdk.setup(sdkConfig: defaultConfig);

    GetHistoryOptions options = GetHistoryOptions(account: account, mint: mint);
    List<HistoryResponse>? res = await sdk.getHistory(options: options);
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
    var sdk = await KineticSdk.setup(sdkConfig: defaultConfig);

    GetTokenAccountsOptions options = GetTokenAccountsOptions(account: account, mint: (mint));
    List<String>? res = await sdk.getTokenAccounts(options: options);
    if (res == null) {
      print("Error requesting token accounts");
      throw Exception("Error requesting token accounts");
    }
    safePrint(res);

    expect(res, const TypeMatcher<List<String>>());
    expect(res.length, greaterThan(0));
  });

  test('Request Airdrop', () async {
    var sdk = await KineticSdk.setup(sdkConfig: defaultConfig);

    RequestAirdropOptions options = RequestAirdropOptions(
      account: account,
      mint: mint,
      amount: "10",
      commitment: RequestAirdropRequestCommitmentEnum.finalized,
    );
    RequestAirdropResponse? res = await sdk.requestAirdrop(options: options);
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
      var sdk = await KineticSdk.setup(sdkConfig: defaultConfig);

      final from = await Keypair().fromByteArray([
        205,
        213,
        7,
        246,
        167,
        206,
        37,
        209,
        161,
        129,
        168,
        160,
        90,
        103,
        198,
        142,
        83,
        177,
        214,
        203,
        80,
        29,
        71,
        245,
        56,
        152,
        15,
        8,
        235,
        174,
        62,
        79,
        138,
        198,
        145,
        111,
        119,
        33,
        15,
        237,
        89,
        201,
        122,
        89,
        48,
        221,
        224,
        71,
        81,
        128,
        45,
        97,
        191,
        105,
        37,
        228,
        243,
        238,
        130,
        151,
        53,
        221,
        172,
        125,
      ]);

      safePrint("From: ${from.publicKey}");
      safePrint("To: BobQoPqWy5cpFioy1dMTYqNH9WpC39mkAEDJWXECoJ9y");

      MakeTransferOptions options = MakeTransferOptions(
        amount: "1.0",
        destination: ("BobQoPqWy5cpFioy1dMTYqNH9WpC39mkAEDJWXECoJ9y"),
        commitment: MakeTransferRequestCommitmentEnum.finalized,
        mint: mint,
        owner: from,
        referenceId: "p2p",
        referenceType: "tx",
        type: TransactionType.p2p,
        senderCreate: true,
      );

      Transaction? transaction = await sdk.makeTransfer(options: options);
      if (transaction != null) {
        print("Error making transfer");
      }
      safePrint(transaction);
      expect(transaction, true);
    },
    timeout: const Timeout(Duration(minutes: 10)),
  );
  //
  // test(
  //   'createAccount',
  //   () async {
  //     var sdk = await KineticSdk.setup(sdkConfig: defaultConfig);
  //
  //     Keypair keypair = Keypair();
  //     final from = await keypair.random();
  //
  //     CreateAccountOptions options = CreateAccountOptions(
  //       owner: from,
  //       mint: mint,
  //       commitment: CreateAccountRequestCommitmentEnum.finalized,
  //       referenceId: 'dart',
  //       referenceType: 'test',
  //     );
  //     Transaction? res = await sdk.createAccount(options: options);
  //     if (res == null) {
  //       print("Error creating account");
  //       throw Exception("Error creating account");
  //     }
  //     safePrint(res?.toJson());
  //     expect(res, true);
  //   },
  //   timeout: const Timeout(Duration(minutes: 10)),
  // );
}
