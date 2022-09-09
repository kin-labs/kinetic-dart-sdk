//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MinimumRentExemptionBalanceResponse {
  /// Returns a new [MinimumRentExemptionBalanceResponse] instance.
  MinimumRentExemptionBalanceResponse({
    required this.lamports,
  });

  double lamports;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MinimumRentExemptionBalanceResponse &&
     other.lamports == lamports;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lamports.hashCode);

  @override
  String toString() => 'MinimumRentExemptionBalanceResponse[lamports=$lamports]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'lamports'] = lamports;
    return _json;
  }

  /// Returns a new [MinimumRentExemptionBalanceResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MinimumRentExemptionBalanceResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MinimumRentExemptionBalanceResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MinimumRentExemptionBalanceResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MinimumRentExemptionBalanceResponse(
        lamports: mapValueOfType<double>(json, r'lamports')!,
      );
    }
    return null;
  }

  static List<MinimumRentExemptionBalanceResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MinimumRentExemptionBalanceResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MinimumRentExemptionBalanceResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MinimumRentExemptionBalanceResponse> mapFromJson(dynamic json) {
    final map = <String, MinimumRentExemptionBalanceResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MinimumRentExemptionBalanceResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MinimumRentExemptionBalanceResponse-objects as value to a dart map
  static Map<String, List<MinimumRentExemptionBalanceResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MinimumRentExemptionBalanceResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MinimumRentExemptionBalanceResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'lamports',
  };
}

