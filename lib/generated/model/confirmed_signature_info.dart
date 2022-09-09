//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConfirmedSignatureInfo {
  /// Returns a new [ConfirmedSignatureInfo] instance.
  ConfirmedSignatureInfo({
    required this.signature,
    required this.slot,
    required this.err,
    required this.memo,
    required this.blockTime,
  });

  String signature;

  num slot;

  String err;

  String memo;

  num blockTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConfirmedSignatureInfo &&
     other.signature == signature &&
     other.slot == slot &&
     other.err == err &&
     other.memo == memo &&
     other.blockTime == blockTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (signature.hashCode) +
    (slot.hashCode) +
    (err.hashCode) +
    (memo.hashCode) +
    (blockTime.hashCode);

  @override
  String toString() => 'ConfirmedSignatureInfo[signature=$signature, slot=$slot, err=$err, memo=$memo, blockTime=$blockTime]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'signature'] = signature;
      _json[r'slot'] = slot;
      _json[r'err'] = err;
      _json[r'memo'] = memo;
      _json[r'blockTime'] = blockTime;
    return _json;
  }

  /// Returns a new [ConfirmedSignatureInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConfirmedSignatureInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ConfirmedSignatureInfo[$key]" is missing from JSON.');
          // assert(json[key] != null, 'Required key "ConfirmedSignatureInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      // TODO: check
      // return ConfirmedSignatureInfo(
      //   signature: mapValueOfType<String>(json, r'signature')!,
      //   slot: json[r'slot'] == null
      //       ? null
      //       : num.parse(json[r'slot'].toString()),
      //   err: mapValueOfType<String>(json, r'err')!,
      //   memo: mapValueOfType<String>(json, r'memo')!,
      //   blockTime: json[r'blockTime'] == null
      //       ? null
      //       : num.parse(json[r'blockTime'].toString()),
      // );

      return ConfirmedSignatureInfo(
        signature: mapValueOfType<String>(json, r'signature')!,
        slot: num.parse(json[r'slot'].toString()),
        err: mapValueOfType<String>(json, r'err')!,
        memo: mapValueOfType<String>(json, r'memo')!,
        blockTime: num.parse(json[r'blockTime'].toString()),
      );

    }
    return null;
  }

  static List<ConfirmedSignatureInfo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConfirmedSignatureInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConfirmedSignatureInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConfirmedSignatureInfo> mapFromJson(dynamic json) {
    final map = <String, ConfirmedSignatureInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConfirmedSignatureInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConfirmedSignatureInfo-objects as value to a dart map
  static Map<String, List<ConfirmedSignatureInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConfirmedSignatureInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConfirmedSignatureInfo.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'signature',
    'slot',
    'err',
    'memo',
    'blockTime',
  };
}

