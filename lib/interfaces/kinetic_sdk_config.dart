import 'package:kinetic/constants.dart';
import 'package:kinetic/identifiers/version.dart';
import 'package:logger/logger.dart';

import 'kinetic_sdk_environment.dart';

class KineticSdkConfig {
  late int index;
  late KineticSdkEnvironment environment;
  late String endpoint;
  late String solanaRpcEndpoint;
  late String solanaWssEndpoint;
  late Map<String, String> headers;
  late Logger logger;

  KineticSdkConfig({required this.index,required this.endpoint,required this.environment}) {
    logger = Logger();
    solanaRpcEndpoint = environment.endpoint == 'mainnet' ? mainnetRpcEndpoint : devnetRpcEndpoint;
    solanaWssEndpoint = environment.endpoint == 'mainnet' ? mainnetWssEndpoint : devnetWssEndpoint;

    headers = {
      'kinetic-environment': environment.endpoint,
      'kinetic-index': index.toString(),
      'kinetic-user-agent': "DART@$version",
    };
  }
}
