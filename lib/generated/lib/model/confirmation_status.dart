//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ConfirmationStatus {
  /// Instantiate a new enum with the provided [value].
  const ConfirmationStatus._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const processed = ConfirmationStatus._(r'processed');
  static const confirmed = ConfirmationStatus._(r'confirmed');
  static const finalized = ConfirmationStatus._(r'finalized');

  /// List of all possible values in this [enum][ConfirmationStatus].
  static const values = <ConfirmationStatus>[
    processed,
    confirmed,
    finalized,
  ];

  static ConfirmationStatus? fromJson(dynamic value) => ConfirmationStatusTypeTransformer().decode(value);

  static List<ConfirmationStatus>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConfirmationStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConfirmationStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ConfirmationStatus] to String,
/// and [decode] dynamic data back to [ConfirmationStatus].
class ConfirmationStatusTypeTransformer {
  factory ConfirmationStatusTypeTransformer() => _instance ??= const ConfirmationStatusTypeTransformer._();

  const ConfirmationStatusTypeTransformer._();

  String encode(ConfirmationStatus data) => data.value;

  /// Decodes a [dynamic value][data] to a ConfirmationStatus.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ConfirmationStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'processed': return ConfirmationStatus.processed;
        case r'confirmed': return ConfirmationStatus.confirmed;
        case r'finalized': return ConfirmationStatus.finalized;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ConfirmationStatusTypeTransformer] instance.
  static ConfirmationStatusTypeTransformer? _instance;
}

