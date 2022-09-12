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

  AppConfigClusterTypeEnum type;

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
        type: AppConfigClusterTypeEnum.fromJson(json[r'type'])!,
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


class AppConfigClusterTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const AppConfigClusterTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const custom = AppConfigClusterTypeEnum._(r'Custom');
  static const solanaDevnet = AppConfigClusterTypeEnum._(r'SolanaDevnet');
  static const solanaMainnet = AppConfigClusterTypeEnum._(r'SolanaMainnet');
  static const solanaTestnet = AppConfigClusterTypeEnum._(r'SolanaTestnet');

  /// List of all possible values in this [enum][AppConfigClusterTypeEnum].
  static const values = <AppConfigClusterTypeEnum>[
    custom,
    solanaDevnet,
    solanaMainnet,
    solanaTestnet,
  ];

  static AppConfigClusterTypeEnum? fromJson(dynamic value) => AppConfigClusterTypeEnumTypeTransformer().decode(value);

  static List<AppConfigClusterTypeEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppConfigClusterTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppConfigClusterTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AppConfigClusterTypeEnum] to String,
/// and [decode] dynamic data back to [AppConfigClusterTypeEnum].
class AppConfigClusterTypeEnumTypeTransformer {
  factory AppConfigClusterTypeEnumTypeTransformer() => _instance ??= const AppConfigClusterTypeEnumTypeTransformer._();

  const AppConfigClusterTypeEnumTypeTransformer._();

  String encode(AppConfigClusterTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AppConfigClusterTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AppConfigClusterTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Custom': return AppConfigClusterTypeEnum.custom;
        case r'SolanaDevnet': return AppConfigClusterTypeEnum.solanaDevnet;
        case r'SolanaMainnet': return AppConfigClusterTypeEnum.solanaMainnet;
        case r'SolanaTestnet': return AppConfigClusterTypeEnum.solanaTestnet;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AppConfigClusterTypeEnumTypeTransformer] instance.
  static AppConfigClusterTypeEnumTypeTransformer? _instance;
}


