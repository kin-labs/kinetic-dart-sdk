//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestAirdropResponse {
  /// Returns a new [RequestAirdropResponse] instance.
  RequestAirdropResponse({
    required this.signature,
  });

  String signature;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequestAirdropResponse &&
     other.signature == signature;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (signature.hashCode);

  @override
  String toString() => 'RequestAirdropResponse[signature=$signature]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'signature'] = signature;
    return _json;
  }

  /// Returns a new [RequestAirdropResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RequestAirdropResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RequestAirdropResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RequestAirdropResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RequestAirdropResponse(
        signature: mapValueOfType<String>(json, r'signature')!,
      );
    }
    return null;
  }

  static List<RequestAirdropResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RequestAirdropResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RequestAirdropResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RequestAirdropResponse> mapFromJson(dynamic json) {
    final map = <String, RequestAirdropResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequestAirdropResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RequestAirdropResponse-objects as value to a dart map
  static Map<String, List<RequestAirdropResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RequestAirdropResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequestAirdropResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'signature',
  };
}

