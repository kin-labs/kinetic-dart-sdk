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
    Map<String, String>? defaultHeaders = {
      'kinetic-environment': environment,
      'kinetic-index': index.toString(),
      'kinetic-user-agent': "$name/$version",
    };
    headers = headers != null ? {...defaultHeaders, ...headers!} : defaultHeaders;
  }
}
