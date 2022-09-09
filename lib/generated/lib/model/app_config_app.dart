//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppConfigApp {
  /// Returns a new [AppConfigApp] instance.
  AppConfigApp({
    required this.index,
    required this.name,
  });

  int index;

  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppConfigApp &&
     other.index == index &&
     other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (index.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'AppConfigApp[index=$index, name=$name]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'index'] = index;
      _json[r'name'] = name;
    return _json;
  }

  /// Returns a new [AppConfigApp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppConfigApp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppConfigApp[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppConfigApp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppConfigApp(
        index: mapValueOfType<int>(json, r'index')!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<AppConfigApp>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppConfigApp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppConfigApp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppConfigApp> mapFromJson(dynamic json) {
    final map = <String, AppConfigApp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfigApp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppConfigApp-objects as value to a dart map
  static Map<String, List<AppConfigApp>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppConfigApp>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfigApp.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'index',
    'name',
  };
}

