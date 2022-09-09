//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LatestBlockhashResponse {
  /// Returns a new [LatestBlockhashResponse] instance.
  LatestBlockhashResponse({
    required this.blockhash,
    required this.lastValidBlockHeight,
  });

  String blockhash;

  int lastValidBlockHeight;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LatestBlockhashResponse &&
     other.blockhash == blockhash &&
     other.lastValidBlockHeight == lastValidBlockHeight;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (blockhash.hashCode) +
    (lastValidBlockHeight.hashCode);

  @override
  String toString() => 'LatestBlockhashResponse[blockhash=$blockhash, lastValidBlockHeight=$lastValidBlockHeight]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'blockhash'] = blockhash;
      _json[r'lastValidBlockHeight'] = lastValidBlockHeight;
    return _json;
  }

  /// Returns a new [LatestBlockhashResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LatestBlockhashResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LatestBlockhashResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LatestBlockhashResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LatestBlockhashResponse(
        blockhash: mapValueOfType<String>(json, r'blockhash')!,
        lastValidBlockHeight: mapValueOfType<int>(json, r'lastValidBlockHeight')!,
      );
    }
    return null;
  }

  static List<LatestBlockhashResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LatestBlockhashResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LatestBlockhashResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LatestBlockhashResponse> mapFromJson(dynamic json) {
    final map = <String, LatestBlockhashResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LatestBlockhashResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LatestBlockhashResponse-objects as value to a dart map
  static Map<String, List<LatestBlockhashResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LatestBlockhashResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LatestBlockhashResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'blockhash',
    'lastValidBlockHeight',
  };
}

