//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppHealth {
  /// Returns a new [AppHealth] instance.
  AppHealth({
    required this.isSolanaOk,
    required this.isKineticOk,
    required this.time,
  });

  bool isSolanaOk;

  bool isKineticOk;

  DateTime time;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppHealth &&
     other.isSolanaOk == isSolanaOk &&
     other.isKineticOk == isKineticOk &&
     other.time == time;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isSolanaOk.hashCode) +
    (isKineticOk.hashCode) +
    (time.hashCode);

  @override
  String toString() => 'AppHealth[isSolanaOk=$isSolanaOk, isKineticOk=$isKineticOk, time=$time]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'isSolanaOk'] = isSolanaOk;
      _json[r'isKineticOk'] = isKineticOk;
      _json[r'time'] = time.toUtc().toIso8601String();
    return _json;
  }

  /// Returns a new [AppHealth] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppHealth? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppHealth[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppHealth[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppHealth(
        isSolanaOk: mapValueOfType<bool>(json, r'isSolanaOk')!,
        isKineticOk: mapValueOfType<bool>(json, r'isKineticOk')!,
        time: mapDateTime(json, r'time', '')!,
      );
    }
    return null;
  }

  static List<AppHealth>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppHealth>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppHealth.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppHealth> mapFromJson(dynamic json) {
    final map = <String, AppHealth>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppHealth.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppHealth-objects as value to a dart map
  static Map<String, List<AppHealth>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppHealth>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppHealth.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'isSolanaOk',
    'isKineticOk',
    'time',
  };
}

