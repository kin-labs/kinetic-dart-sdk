//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BalanceResponse {
  /// Returns a new [BalanceResponse] instance.
  BalanceResponse({
    required this.balance,
    required this.mints,
    this.tokens = const [],
  });

  String balance;

  Object mints;

  List<BalanceToken> tokens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BalanceResponse &&
     other.balance == balance &&
     other.mints == mints &&
     other.tokens == tokens;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (balance.hashCode) +
    (mints.hashCode) +
    (tokens.hashCode);

  @override
  String toString() => 'BalanceResponse[balance=$balance, mints=$mints, tokens=$tokens]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'balance'] = balance;
      _json[r'mints'] = mints;
      _json[r'tokens'] = tokens;
    return _json;
  }

  /// Returns a new [BalanceResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BalanceResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BalanceResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BalanceResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BalanceResponse(
        balance: mapValueOfType<String>(json, r'balance')!,
        mints: mapValueOfType<Object>(json, r'mints')!,
        tokens: BalanceToken.listFromJson(json[r'tokens'])!,
      );
    }
    return null;
  }

  static List<BalanceResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BalanceResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BalanceResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BalanceResponse> mapFromJson(dynamic json) {
    final map = <String, BalanceResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BalanceResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BalanceResponse-objects as value to a dart map
  static Map<String, List<BalanceResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BalanceResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BalanceResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'balance',
    'mints',
    'tokens',
  };
}

