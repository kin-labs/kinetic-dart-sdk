//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class Commitment {
  /// Instantiate a new enum with the provided [value].
  const Commitment._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const confirmed = Commitment._(r'Confirmed');
  static const finalized = Commitment._(r'Finalized');
  static const processed = Commitment._(r'Processed');

  /// List of all possible values in this [enum][Commitment].
  static const values = <Commitment>[
    confirmed,
    finalized,
    processed,
  ];

  static Commitment? fromJson(dynamic value) => CommitmentTypeTransformer().decode(value);

  static List<Commitment>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Commitment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Commitment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Commitment] to String,
/// and [decode] dynamic data back to [Commitment].
class CommitmentTypeTransformer {
  factory CommitmentTypeTransformer() => _instance ??= const CommitmentTypeTransformer._();

  const CommitmentTypeTransformer._();

  String encode(Commitment data) => data.value;

  /// Decodes a [dynamic value][data] to a Commitment.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Commitment? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Confirmed': return Commitment.confirmed;
        case r'Finalized': return Commitment.finalized;
        case r'Processed': return Commitment.processed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CommitmentTypeTransformer] instance.
  static CommitmentTypeTransformer? _instance;
}

