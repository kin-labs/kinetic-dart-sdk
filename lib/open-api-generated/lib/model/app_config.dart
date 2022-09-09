//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppConfig {
  /// Returns a new [AppConfig] instance.
  AppConfig({
    required this.app,
    required this.api,
    required this.environment,
    required this.mint,
    this.mints = const [],
  });

  AppConfigApp app;

  AppConfigApi api;

  AppConfigEnvironment environment;

  AppConfigMint mint;

  List<AppConfigMint> mints;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppConfig &&
     other.app == app &&
     other.api == api &&
     other.environment == environment &&
     other.mint == mint &&
     other.mints == mints;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (app.hashCode) +
    (api.hashCode) +
    (environment.hashCode) +
    (mint.hashCode) +
    (mints.hashCode);

  @override
  String toString() => 'AppConfig[app=$app, api=$api, environment=$environment, mint=$mint, mints=$mints]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'app'] = app;
      _json[r'api'] = api;
      _json[r'environment'] = environment;
      _json[r'mint'] = mint;
      _json[r'mints'] = mints;
    return _json;
  }

  /// Returns a new [AppConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppConfig(
        app: AppConfigApp.fromJson(json[r'app'])!,
        api: AppConfigApi.fromJson(json[r'api'])!,
        environment: AppConfigEnvironment.fromJson(json[r'environment'])!,
        mint: AppConfigMint.fromJson(json[r'mint'])!,
        mints: AppConfigMint.listFromJson(json[r'mints'])!,
      );
    }
    return null;
  }

  static List<AppConfig>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppConfig> mapFromJson(dynamic json) {
    final map = <String, AppConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppConfig-objects as value to a dart map
  static Map<String, List<AppConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppConfig>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfig.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'app',
    'api',
    'environment',
    'mint',
    'mints',
  };
}

