import 'package:kinetic/generated/lib/api.dart';
import 'package:kinetic/interfaces/kinetic_sdk_config.dart';

KineticSdkConfig validateKineticSdkConfig(KineticSdkConfig sdkConfig) {
  if (!sdkConfig.endpoint.startsWith('http')) {
    throw Exception('validateKineticSdkConfig: the endpoint should start with http or https.');
  }
  sdkConfig.commitment ??= Commitment.confirmed;
  sdkConfig.endpoint = sdkConfig.endpoint.replaceAll(RegExp(r'\/$'), '');
  return sdkConfig;
}
