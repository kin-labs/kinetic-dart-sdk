import 'package:kinetic/constants.dart';
import 'package:kinetic/identifiers/version.dart';
import 'package:logger/logger.dart';
import 'package:solana/solana.dart' as solana;

import 'commitment.dart';
import 'generated/lib/api.dart';

class KineticSdkConfig {
  late int index;
  late KineticSdkEnvironment environment;
  late String endpoint;
  late String solanaRpcEndpoint;
  late String solanaWssEndpoint;
  late Map<String, String> headers;
  late Logger logger;

  KineticSdkConfig({required this.index, required this.environment, required this.logger}) {
    endpoint = "sandbox.kinetic.host";
    solanaRpcEndpoint = environment == KineticSdkEnvironment.mainnet ? mainnetRpcEndpoint : devnetRpcEndpoint;
    solanaWssEndpoint = environment == KineticSdkEnvironment.mainnet ? mainnetWssEndpoint : devnetWssEndpoint;

    headers = {
      'kinetic-environment': environment.name,
      'kinetic-index': environment.index.toString(),
      'kinetic-user-agent': "DART@$version",
    };

  }
}

enum KineticSdkEnvironment {
  devnet,
  mainnet
}

class KineticInitializationException implements Exception {
  String errMsg() => "Local Kinetic instance not initialized.";
}

class KineticUnknownFeePayerException implements Exception {
  String errMsg() => "Kinetic Fee Payer not set.";
}

class KineticInvalidDestinationException implements Exception {
  String errMsg() => "Destination set is not valid";
}

class KineticUnknownDecimalsException implements Exception {
  String errMsg() => "Cannot find decimals in current App Config";
}

class KineticMissingMintsException implements Exception {
  String errMsg() => "Kinetic Mints list is incomplete or not found.";
}

class KineticForeignKeyLengthException implements Exception {
  String errMsg() => "Foreign key size used in memo is too large.";
}

enum TransactionType {
  none,
  earn,
  spend,
  p2p,
}

class GetBalanceOptions {
  GetBalanceOptions({required this.account,});

  late solana.Ed25519HDPublicKey account;
}

class GetHistoryOptions {
  GetHistoryOptions({required this.account, required this.mint});

  late solana.Ed25519HDPublicKey account;
  late solana.Ed25519HDPublicKey mint;
}

class GetTokenAccountsOptions {
  GetTokenAccountsOptions({required this.account, required this.mint});

  late solana.Ed25519HDPublicKey account;
  late solana.Ed25519HDPublicKey mint;
}

class RequestAirdropOptions {
  RequestAirdropOptions({required this.account, required this.mint, required this.amount, required this.commitment});

  late solana.Ed25519HDPublicKey account;
  late solana.Ed25519HDPublicKey mint;
  late String amount;
  // late Commitment commitment;
  late RequestAirdropRequestCommitmentEnum commitment;
}

abstract class TransferDestination {
  late String amount;
  late solana.Ed25519HDPublicKey destination;
}

class MakeTransferOptions implements TransferDestination {
  MakeTransferOptions({
    required this.amount,
    required this.destination,
    required this.commitment,
    required this.mint,
    required this.owner,
    required this.referenceId,
    required this.referenceType,
    required this.type
  });

  @override
  String amount;

  @override
  solana.Ed25519HDPublicKey destination;

  late MakeTransferRequestCommitmentEnum commitment;
  late String mint;
  late solana.Ed25519HDKeyPair owner;
  late String referenceId;
  late String referenceType;
  late TransactionType type;

}

class CreateAccountOptions {
  CreateAccountOptions({required this.owner, required this.mint, required this.commitment});

  late Commitment commitment;
  late String mint;
  late solana.Ed25519HDKeyPair owner;
}