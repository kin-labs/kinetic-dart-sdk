//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TransactionStatus {
  /// Instantiate a new enum with the provided [value].
  const TransactionStatus._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const committed = TransactionStatus._(r'Committed');
  static const confirmed = TransactionStatus._(r'Confirmed');
  static const failed = TransactionStatus._(r'Failed');
  static const finalized = TransactionStatus._(r'Finalized');
  static const processing = TransactionStatus._(r'Processing');

  /// List of all possible values in this [enum][TransactionStatus].
  static const values = <TransactionStatus>[
    committed,
    confirmed,
    failed,
    finalized,
    processing,
  ];

  static TransactionStatus? fromJson(dynamic value) => TransactionStatusTypeTransformer().decode(value);

  static List<TransactionStatus>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransactionStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransactionStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TransactionStatus] to String,
/// and [decode] dynamic data back to [TransactionStatus].
class TransactionStatusTypeTransformer {
  factory TransactionStatusTypeTransformer() => _instance ??= const TransactionStatusTypeTransformer._();

  const TransactionStatusTypeTransformer._();

  String encode(TransactionStatus data) => data.value;

  /// Decodes a [dynamic value][data] to a TransactionStatus.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TransactionStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Committed': return TransactionStatus.committed;
        case r'Confirmed': return TransactionStatus.confirmed;
        case r'Failed': return TransactionStatus.failed;
        case r'Finalized': return TransactionStatus.finalized;
        case r'Processing': return TransactionStatus.processing;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TransactionStatusTypeTransformer] instance.
  static TransactionStatusTypeTransformer? _instance;
}

