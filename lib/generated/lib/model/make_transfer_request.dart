//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MakeTransferRequest {
  /// Returns a new [MakeTransferRequest] instance.
  MakeTransferRequest({
    required this.commitment,
    required this.environment,
    required this.index,
    required this.mint,
    required this.lastValidBlockHeight,
    this.referenceId,
    this.referenceType,
    required this.tx,
  });

  Commitment commitment;

  String environment;

  int index;

  String mint;

  int lastValidBlockHeight;

  String? referenceId;

  String? referenceType;

  String tx;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MakeTransferRequest &&
     other.commitment == commitment &&
     other.environment == environment &&
     other.index == index &&
     other.mint == mint &&
     other.lastValidBlockHeight == lastValidBlockHeight &&
     other.referenceId == referenceId &&
     other.referenceType == referenceType &&
     other.tx == tx;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (commitment.hashCode) +
    (environment.hashCode) +
    (index.hashCode) +
    (mint.hashCode) +
    (lastValidBlockHeight.hashCode) +
    (referenceId == null ? 0 : referenceId!.hashCode) +
    (referenceType == null ? 0 : referenceType!.hashCode) +
    (tx.hashCode);

  @override
  String toString() => 'MakeTransferRequest[commitment=$commitment, environment=$environment, index=$index, mint=$mint, lastValidBlockHeight=$lastValidBlockHeight, referenceId=$referenceId, referenceType=$referenceType, tx=$tx]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'commitment'] = commitment;
      _json[r'environment'] = environment;
      _json[r'index'] = index;
      _json[r'mint'] = mint;
      _json[r'lastValidBlockHeight'] = lastValidBlockHeight;
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

  /// Returns a new [MakeTransferRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MakeTransferRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MakeTransferRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MakeTransferRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MakeTransferRequest(
        commitment: Commitment.fromJson(json[r'commitment'])!,
        environment: mapValueOfType<String>(json, r'environment')!,
        index: mapValueOfType<int>(json, r'index')!,
        mint: mapValueOfType<String>(json, r'mint')!,
        lastValidBlockHeight: mapValueOfType<int>(json, r'lastValidBlockHeight')!,
        referenceId: mapValueOfType<String>(json, r'referenceId'),
        referenceType: mapValueOfType<String>(json, r'referenceType'),
        tx: mapValueOfType<String>(json, r'tx')!,
      );
    }
    return null;
  }

  static List<MakeTransferRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MakeTransferRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MakeTransferRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MakeTransferRequest> mapFromJson(dynamic json) {
    final map = <String, MakeTransferRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MakeTransferRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MakeTransferRequest-objects as value to a dart map
  static Map<String, List<MakeTransferRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MakeTransferRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MakeTransferRequest.listFromJson(entry.value, growable: growable,);
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
    'mint',
    'lastValidBlockHeight',
    'tx',
  };
}

