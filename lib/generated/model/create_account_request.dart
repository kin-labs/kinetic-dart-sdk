//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateAccountRequest {
  /// Returns a new [CreateAccountRequest] instance.
  CreateAccountRequest({
    required this.environment,
    required this.index,
    required this.mint,
    required this.tx,
  });

  String environment;

  int index;

  String mint;

  String tx;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateAccountRequest &&
     other.environment == environment &&
     other.index == index &&
     other.mint == mint &&
     other.tx == tx;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (environment.hashCode) +
    (index.hashCode) +
    (mint.hashCode) +
    (tx.hashCode);

  @override
  String toString() => 'CreateAccountRequest[environment=$environment, index=$index, mint=$mint, tx=$tx]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'environment'] = environment;
      _json[r'index'] = index;
      _json[r'mint'] = mint;
      _json[r'tx'] = tx;
    return _json;
  }

  /// Returns a new [CreateAccountRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateAccountRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateAccountRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateAccountRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateAccountRequest(
        environment: mapValueOfType<String>(json, r'environment')!,
        index: mapValueOfType<int>(json, r'index')!,
        mint: mapValueOfType<String>(json, r'mint')!,
        tx: mapValueOfType<String>(json, r'tx')!,
      );
    }
    return null;
  }

  static List<CreateAccountRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateAccountRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateAccountRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateAccountRequest> mapFromJson(dynamic json) {
    final map = <String, CreateAccountRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateAccountRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateAccountRequest-objects as value to a dart map
  static Map<String, List<CreateAccountRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateAccountRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateAccountRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'environment',
    'index',
    'mint',
    'tx',
  };
}

