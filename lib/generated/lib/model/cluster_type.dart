//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ClusterType {
  /// Instantiate a new enum with the provided [value].
  const ClusterType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const custom = ClusterType._(r'Custom');
  static const solanaDevnet = ClusterType._(r'SolanaDevnet');
  static const solanaMainnet = ClusterType._(r'SolanaMainnet');
  static const solanaTestnet = ClusterType._(r'SolanaTestnet');

  /// List of all possible values in this [enum][ClusterType].
  static const values = <ClusterType>[
    custom,
    solanaDevnet,
    solanaMainnet,
    solanaTestnet,
  ];

  static ClusterType? fromJson(dynamic value) => ClusterTypeTypeTransformer().decode(value);

  static List<ClusterType>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ClusterType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClusterType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ClusterType] to String,
/// and [decode] dynamic data back to [ClusterType].
class ClusterTypeTypeTransformer {
  factory ClusterTypeTypeTransformer() => _instance ??= const ClusterTypeTypeTransformer._();

  const ClusterTypeTypeTransformer._();

  String encode(ClusterType data) => data.value;

  /// Decodes a [dynamic value][data] to a ClusterType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ClusterType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Custom': return ClusterType.custom;
        case r'SolanaDevnet': return ClusterType.solanaDevnet;
        case r'SolanaMainnet': return ClusterType.solanaMainnet;
        case r'SolanaTestnet': return ClusterType.solanaTestnet;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ClusterTypeTypeTransformer] instance.
  static ClusterTypeTypeTransformer? _instance;
}

