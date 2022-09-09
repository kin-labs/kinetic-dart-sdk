//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AirdropStatsDate {
  /// Returns a new [AirdropStatsDate] instance.
  AirdropStatsDate({
    required this.date,
    required this.count,
  });

  String date;

  int count;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AirdropStatsDate &&
     other.date == date &&
     other.count == count;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (date.hashCode) +
    (count.hashCode);

  @override
  String toString() => 'AirdropStatsDate[date=$date, count=$count]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'date'] = date;
      _json[r'count'] = count;
    return _json;
  }

  /// Returns a new [AirdropStatsDate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AirdropStatsDate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AirdropStatsDate[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AirdropStatsDate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AirdropStatsDate(
        date: mapValueOfType<String>(json, r'date')!,
        count: mapValueOfType<int>(json, r'count')!,
      );
    }
    return null;
  }

  static List<AirdropStatsDate>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AirdropStatsDate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AirdropStatsDate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AirdropStatsDate> mapFromJson(dynamic json) {
    final map = <String, AirdropStatsDate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AirdropStatsDate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AirdropStatsDate-objects as value to a dart map
  static Map<String, List<AirdropStatsDate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AirdropStatsDate>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AirdropStatsDate.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'date',
    'count',
  };
}

