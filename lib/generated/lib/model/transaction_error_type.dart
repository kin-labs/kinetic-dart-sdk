//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TransactionErrorType {
  /// Instantiate a new enum with the provided [value].
  const TransactionErrorType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const badNonce = TransactionErrorType._(r'BadNonce');
  static const invalidAccount = TransactionErrorType._(r'InvalidAccount');
  static const someError = TransactionErrorType._(r'SomeError');
  static const timeout = TransactionErrorType._(r'Timeout');
  static const unknown = TransactionErrorType._(r'Unknown');
  static const webhookFailed = TransactionErrorType._(r'WebhookFailed');

  /// List of all possible values in this [enum][TransactionErrorType].
  static const values = <TransactionErrorType>[
    badNonce,
    invalidAccount,
    someError,
    timeout,
    unknown,
    webhookFailed,
  ];

  static TransactionErrorType? fromJson(dynamic value) => TransactionErrorTypeTypeTransformer().decode(value);

  static List<TransactionErrorType>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransactionErrorType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransactionErrorType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TransactionErrorType] to String,
/// and [decode] dynamic data back to [TransactionErrorType].
class TransactionErrorTypeTypeTransformer {
  factory TransactionErrorTypeTypeTransformer() => _instance ??= const TransactionErrorTypeTypeTransformer._();

  const TransactionErrorTypeTypeTransformer._();

  String encode(TransactionErrorType data) => data.value;

  /// Decodes a [dynamic value][data] to a TransactionErrorType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TransactionErrorType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'BadNonce': return TransactionErrorType.badNonce;
        case r'InvalidAccount': return TransactionErrorType.invalidAccount;
        case r'SomeError': return TransactionErrorType.someError;
        case r'Timeout': return TransactionErrorType.timeout;
        case r'Unknown': return TransactionErrorType.unknown;
        case r'WebhookFailed': return TransactionErrorType.webhookFailed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TransactionErrorTypeTypeTransformer] instance.
  static TransactionErrorTypeTypeTransformer? _instance;
}

