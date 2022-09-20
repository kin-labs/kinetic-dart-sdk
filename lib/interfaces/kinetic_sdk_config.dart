import 'package:kinetic/identifiers/version.dart';
import 'package:logger/logger.dart';

class KineticSdkConfig {
  late String environment;
  late String endpoint;
  Map<String, String>? headers;
  late int index;
  Logger? logger;
  String? solanaRpcEndpoint;
  String? solanaWssEndpoint;

  KineticSdkConfig({required this.index, required this.endpoint, required this.environment}) {
    // TODO: Make logger optional (passed in from the config)
    logger = Logger();

    headers = {
      // TODO: here we should accept/insert the headers passed in by the user
      // The headers below here should always override what the user passes in.
      'kinetic-environment': environment,
      'kinetic-index': index.toString(),
      'kinetic-user-agent': "DART@$version",
    };
  }
}
