//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppConfigCluster {
  /// Returns a new [AppConfigCluster] instance.
  AppConfigCluster({
    required this.endpoint,
    required this.id,
    required this.name,
    required this.type,
  });

  String endpoint;

  String id;

  String name;

  ClusterType type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppConfigCluster &&
     other.endpoint == endpoint &&
     other.id == id &&
     other.name == name &&
     other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (endpoint.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'AppConfigCluster[endpoint=$endpoint, id=$id, name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'endpoint'] = endpoint;
      _json[r'id'] = id;
      _json[r'name'] = name;
      _json[r'type'] = type;
    return _json;
  }

  /// Returns a new [AppConfigCluster] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppConfigCluster? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppConfigCluster[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppConfigCluster[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppConfigCluster(
        endpoint: mapValueOfType<String>(json, r'endpoint')!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        type: ClusterType.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<AppConfigCluster>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppConfigCluster>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppConfigCluster.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppConfigCluster> mapFromJson(dynamic json) {
    final map = <String, AppConfigCluster>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfigCluster.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppConfigCluster-objects as value to a dart map
  static Map<String, List<AppConfigCluster>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppConfigCluster>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfigCluster.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'endpoint',
    'id',
    'name',
    'type',
  };
}

