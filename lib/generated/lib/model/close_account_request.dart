//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CloseAccountRequest {
  /// Returns a new [CloseAccountRequest] instance.
  CloseAccountRequest({
    required this.commitment,
    required this.account,
    required this.environment,
    required this.index,
    required this.mint,
    this.referenceId,
    this.referenceType,
  });

  Commitment commitment;

  String account;

  String environment;

  int index;

  String mint;

  String? referenceId;

  String? referenceType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CloseAccountRequest &&
     other.commitment == commitment &&
     other.account == account &&
     other.environment == environment &&
     other.index == index &&
     other.mint == mint &&
     other.referenceId == referenceId &&
     other.referenceType == referenceType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (commitment.hashCode) +
    (account.hashCode) +
    (environment.hashCode) +
    (index.hashCode) +
    (mint.hashCode) +
    (referenceId == null ? 0 : referenceId!.hashCode) +
    (referenceType == null ? 0 : referenceType!.hashCode);

  @override
  String toString() => 'CloseAccountRequest[commitment=$commitment, account=$account, environment=$environment, index=$index, mint=$mint, referenceId=$referenceId, referenceType=$referenceType]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'commitment'] = commitment;
      _json[r'account'] = account;
      _json[r'environment'] = environment;
      _json[r'index'] = index;
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
    return _json;
  }

  /// Returns a new [CloseAccountRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CloseAccountRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CloseAccountRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CloseAccountRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CloseAccountRequest(
        commitment: Commitment.fromJson(json[r'commitment'])!,
        account: mapValueOfType<String>(json, r'account')!,
        environment: mapValueOfType<String>(json, r'environment')!,
        index: mapValueOfType<int>(json, r'index')!,
        mint: mapValueOfType<String>(json, r'mint')!,
        referenceId: mapValueOfType<String>(json, r'referenceId'),
        referenceType: mapValueOfType<String>(json, r'referenceType'),
      );
    }
    return null;
  }

  static List<CloseAccountRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CloseAccountRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CloseAccountRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CloseAccountRequest> mapFromJson(dynamic json) {
    final map = <String, CloseAccountRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CloseAccountRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CloseAccountRequest-objects as value to a dart map
  static Map<String, List<CloseAccountRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CloseAccountRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CloseAccountRequest.listFromJson(entry.value, growable: growable,);
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
    'account',
    'environment',
    'index',
    'mint',
  };
}

