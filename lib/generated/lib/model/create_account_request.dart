//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateAccountRequest {
  /// Returns a new [CreateAccountRequest] instance.
  CreateAccountRequest({
    required this.commitment,
    required this.environment,
    required this.index,
    required this.lastValidBlockHeight,
    required this.mint,
    required this.referenceId,
    required this.referenceType,
    required this.tx,
  });

  CreateAccountRequestCommitmentEnum commitment;

  String environment;

  int index;

  int lastValidBlockHeight;

  String mint;

  String? referenceId;

  String? referenceType;

  String tx;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateAccountRequest &&
     other.commitment == commitment &&
     other.environment == environment &&
     other.index == index &&
     other.lastValidBlockHeight == lastValidBlockHeight &&
     other.mint == mint &&
     other.referenceId == referenceId &&
     other.referenceType == referenceType &&
     other.tx == tx;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (commitment.hashCode) +
    (environment.hashCode) +
    (index.hashCode) +
    (lastValidBlockHeight.hashCode) +
    (mint.hashCode) +
    (referenceId == null ? 0 : referenceId!.hashCode) +
    (referenceType == null ? 0 : referenceType!.hashCode) +
    (tx.hashCode);

  @override
  String toString() => 'CreateAccountRequest[commitment=$commitment, environment=$environment, index=$index, lastValidBlockHeight=$lastValidBlockHeight, mint=$mint, referenceId=$referenceId, referenceType=$referenceType, tx=$tx]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'commitment'] = commitment;
      _json[r'environment'] = environment;
      _json[r'index'] = index;
      _json[r'lastValidBlockHeight'] = lastValidBlockHeight;
      _json[r'mint'] = mint;
    if (referenceId != null) {
      _json[r'referenceId'] = referenceId;
    } else {
      _json[r'referenceId'] = null;
    }
    if (referenceType != null) {
      _json[r'referenceType'] = referenceType;
    } else {
      _json[r'referenceType'] = null;
    }
      _json[r'tx'] = tx;
    return _json;
  }

  /// Returns a new [CreateAccountRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateAccountRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateAccountRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateAccountRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateAccountRequest(
        commitment: CreateAccountRequestCommitmentEnum.fromJson(json[r'commitment'])!,
        environment: mapValueOfType<String>(json, r'environment')!,
        index: mapValueOfType<int>(json, r'index')!,
        lastValidBlockHeight: mapValueOfType<int>(json, r'lastValidBlockHeight')!,
        mint: mapValueOfType<String>(json, r'mint')!,
        referenceId: mapValueOfType<String>(json, r'referenceId'),
        referenceType: mapValueOfType<String>(json, r'referenceType'),
        tx: mapValueOfType<String>(json, r'tx')!,
      );
    }
    return null;
  }

  static List<CreateAccountRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateAccountRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateAccountRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateAccountRequest> mapFromJson(dynamic json) {
    final map = <String, CreateAccountRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateAccountRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateAccountRequest-objects as value to a dart map
  static Map<String, List<CreateAccountRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateAccountRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateAccountRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'commitment',
    'environment',
    'index',
    'lastValidBlockHeight',
    'mint',
    'referenceId',
    'referenceType',
    'tx',
  };
}


class CreateAccountRequestCommitmentEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateAccountRequestCommitmentEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const confirmed = CreateAccountRequestCommitmentEnum._(r'Confirmed');
  static const finalized = CreateAccountRequestCommitmentEnum._(r'Finalized');
  static const processed = CreateAccountRequestCommitmentEnum._(r'Processed');

  /// List of all possible values in this [enum][CreateAccountRequestCommitmentEnum].
  static const values = <CreateAccountRequestCommitmentEnum>[
    confirmed,
    finalized,
    processed,
  ];

  static CreateAccountRequestCommitmentEnum? fromJson(dynamic value) => CreateAccountRequestCommitmentEnumTypeTransformer().decode(value);

  static List<CreateAccountRequestCommitmentEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateAccountRequestCommitmentEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateAccountRequestCommitmentEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateAccountRequestCommitmentEnum] to String,
/// and [decode] dynamic data back to [CreateAccountRequestCommitmentEnum].
class CreateAccountRequestCommitmentEnumTypeTransformer {
  factory CreateAccountRequestCommitmentEnumTypeTransformer() => _instance ??= const CreateAccountRequestCommitmentEnumTypeTransformer._();

  const CreateAccountRequestCommitmentEnumTypeTransformer._();

  String encode(CreateAccountRequestCommitmentEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateAccountRequestCommitmentEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateAccountRequestCommitmentEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Confirmed': return CreateAccountRequestCommitmentEnum.confirmed;
        case r'Finalized': return CreateAccountRequestCommitmentEnum.finalized;
        case r'Processed': return CreateAccountRequestCommitmentEnum.processed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateAccountRequestCommitmentEnumTypeTransformer] instance.
  static CreateAccountRequestCommitmentEnumTypeTransformer? _instance;
}


