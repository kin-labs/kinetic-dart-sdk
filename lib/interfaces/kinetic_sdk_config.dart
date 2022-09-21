import 'package:kinetic/version.dart';
import 'package:logger/logger.dart';

class KineticSdkConfig {
  late String environment;
  late String endpoint;
  Map<String, String>? headers;
  late int index;
  Logger? logger;
  String? solanaRpcEndpoint;
  String? solanaWssEndpoint;

  KineticSdkConfig(
      {required this.index, required this.endpoint, required this.environment, this.headers, this.logger}) {
    headers = {
      // TODO: make sure user headers are passed in
      // ...headers,
      // The headers below here should always override what the user passes in.
      'kinetic-environment': environment,
      'kinetic-index': index.toString(),
      'kinetic-user-agent': "DART@$version",
    };
  }
}
