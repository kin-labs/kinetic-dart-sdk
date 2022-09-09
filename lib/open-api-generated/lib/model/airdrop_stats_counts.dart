//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AirdropStatsCounts {
  /// Returns a new [AirdropStatsCounts] instance.
  AirdropStatsCounts({
    required this.averageValue,
    required this.total,
    required this.totalValue,
  });

  int averageValue;

  int total;

  int totalValue;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AirdropStatsCounts &&
     other.averageValue == averageValue &&
     other.total == total &&
     other.totalValue == totalValue;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (averageValue.hashCode) +
    (total.hashCode) +
    (totalValue.hashCode);

  @override
  String toString() => 'AirdropStatsCounts[averageValue=$averageValue, total=$total, totalValue=$totalValue]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'averageValue'] = averageValue;
      _json[r'total'] = total;
      _json[r'totalValue'] = totalValue;
    return _json;
  }

  /// Returns a new [AirdropStatsCounts] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AirdropStatsCounts? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AirdropStatsCounts[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AirdropStatsCounts[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AirdropStatsCounts(
        averageValue: mapValueOfType<int>(json, r'averageValue')!,
        total: mapValueOfType<int>(json, r'total')!,
        totalValue: mapValueOfType<int>(json, r'totalValue')!,
      );
    }
    return null;
  }

  static List<AirdropStatsCounts>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AirdropStatsCounts>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AirdropStatsCounts.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AirdropStatsCounts> mapFromJson(dynamic json) {
    final map = <String, AirdropStatsCounts>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AirdropStatsCounts.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AirdropStatsCounts-objects as value to a dart map
  static Map<String, List<AirdropStatsCounts>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AirdropStatsCounts>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AirdropStatsCounts.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'averageValue',
    'total',
    'totalValue',
  };
}

