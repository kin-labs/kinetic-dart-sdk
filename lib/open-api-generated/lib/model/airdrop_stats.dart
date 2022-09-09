//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AirdropStats {
  /// Returns a new [AirdropStats] instance.
  AirdropStats({
    required this.counts,
    this.dates = const [],
  });

  AirdropStatsCounts counts;

  List<AirdropStatsDate> dates;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AirdropStats &&
     other.counts == counts &&
     other.dates == dates;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (counts.hashCode) +
    (dates.hashCode);

  @override
  String toString() => 'AirdropStats[counts=$counts, dates=$dates]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'counts'] = counts;
      _json[r'dates'] = dates;
    return _json;
  }

  /// Returns a new [AirdropStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AirdropStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AirdropStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AirdropStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AirdropStats(
        counts: AirdropStatsCounts.fromJson(json[r'counts'])!,
        dates: AirdropStatsDate.listFromJson(json[r'dates'])!,
      );
    }
    return null;
  }

  static List<AirdropStats>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AirdropStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AirdropStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AirdropStats> mapFromJson(dynamic json) {
    final map = <String, AirdropStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AirdropStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AirdropStats-objects as value to a dart map
  static Map<String, List<AirdropStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AirdropStats>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AirdropStats.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'counts',
    'dates',
  };
}

