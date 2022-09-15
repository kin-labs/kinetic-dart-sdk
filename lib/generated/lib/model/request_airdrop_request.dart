//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequestAirdropRequest {
  /// Returns a new [RequestAirdropRequest] instance.
  RequestAirdropRequest({
    required this.account,
    this.amount,
    required this.commitment,
    required this.environment,
    required this.index,
    required this.mint,
  });

  String account;

  String? amount;

  RequestAirdropRequestCommitmentEnum commitment;

  String environment;

  int index;

  String mint;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequestAirdropRequest &&
     other.account == account &&
     other.amount == amount &&
     other.commitment == commitment &&
     other.environment == environment &&
     other.index == index &&
     other.mint == mint;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (account.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (commitment.hashCode) +
    (environment.hashCode) +
    (index.hashCode) +
    (mint.hashCode);

  @override
  String toString() => 'RequestAirdropRequest[account=$account, amount=$amount, commitment=$commitment, environment=$environment, index=$index, mint=$mint]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'account'] = account;
    if (amount != null) {
      _json[r'amount'] = amount;
    } else {
      _json[r'amount'] = null;
    }
      _json[r'commitment'] = commitment;
      _json[r'environment'] = environment;
      _json[r'index'] = index;
      _json[r'mint'] = mint;
    return _json;
  }

  /// Returns a new [RequestAirdropRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RequestAirdropRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RequestAirdropRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RequestAirdropRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RequestAirdropRequest(
        account: mapValueOfType<String>(json, r'account')!,
        amount: mapValueOfType<String>(json, r'amount'),
        commitment: RequestAirdropRequestCommitmentEnum.fromJson(json[r'commitment'])!,
        environment: mapValueOfType<String>(json, r'environment')!,
        index: mapValueOfType<int>(json, r'index')!,
        mint: mapValueOfType<String>(json, r'mint')!,
      );
    }
    return null;
  }

  static List<RequestAirdropRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RequestAirdropRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RequestAirdropRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RequestAirdropRequest> mapFromJson(dynamic json) {
    final map = <String, RequestAirdropRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequestAirdropRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RequestAirdropRequest-objects as value to a dart map
  static Map<String, List<RequestAirdropRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RequestAirdropRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequestAirdropRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'account',
    'commitment',
    'environment',
    'index',
    'mint',
  };
}


class RequestAirdropRequestCommitmentEnum {
  /// Instantiate a new enum with the provided [value].
  const RequestAirdropRequestCommitmentEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const confirmed = RequestAirdropRequestCommitmentEnum._(r'Confirmed');
  static const finalized = RequestAirdropRequestCommitmentEnum._(r'Finalized');
  static const processed = RequestAirdropRequestCommitmentEnum._(r'Processed');

  /// List of all possible values in this [enum][RequestAirdropRequestCommitmentEnum].
  static const values = <RequestAirdropRequestCommitmentEnum>[
    confirmed,
    finalized,
    processed,
  ];

  static RequestAirdropRequestCommitmentEnum? fromJson(dynamic value) => RequestAirdropRequestCommitmentEnumTypeTransformer().decode(value);

  static List<RequestAirdropRequestCommitmentEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RequestAirdropRequestCommitmentEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RequestAirdropRequestCommitmentEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RequestAirdropRequestCommitmentEnum] to String,
/// and [decode] dynamic data back to [RequestAirdropRequestCommitmentEnum].
class RequestAirdropRequestCommitmentEnumTypeTransformer {
  factory RequestAirdropRequestCommitmentEnumTypeTransformer() => _instance ??= const RequestAirdropRequestCommitmentEnumTypeTransformer._();

  const RequestAirdropRequestCommitmentEnumTypeTransformer._();

  String encode(RequestAirdropRequestCommitmentEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RequestAirdropRequestCommitmentEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RequestAirdropRequestCommitmentEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Confirmed': return RequestAirdropRequestCommitmentEnum.confirmed;
        case r'Finalized': return RequestAirdropRequestCommitmentEnum.finalized;
        case r'Processed': return RequestAirdropRequestCommitmentEnum.processed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RequestAirdropRequestCommitmentEnumTypeTransformer] instance.
  static RequestAirdropRequestCommitmentEnumTypeTransformer? _instance;
}


