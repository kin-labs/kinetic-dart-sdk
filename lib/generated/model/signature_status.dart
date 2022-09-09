//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignatureStatus {
  /// Returns a new [SignatureStatus] instance.
  SignatureStatus({
    this.slot,
    this.confirmations,
    required this.err,
    required this.confirmationStatus,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? slot;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? confirmations;

  Object err;

  Object confirmationStatus;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SignatureStatus &&
     other.slot == slot &&
     other.confirmations == confirmations &&
     other.err == err &&
     other.confirmationStatus == confirmationStatus;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (slot == null ? 0 : slot!.hashCode) +
    (confirmations == null ? 0 : confirmations!.hashCode) +
    (err.hashCode) +
    (confirmationStatus.hashCode);

  @override
  String toString() => 'SignatureStatus[slot=$slot, confirmations=$confirmations, err=$err, confirmationStatus=$confirmationStatus]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (slot != null) {
      _json[r'slot'] = slot;
    } else {
      _json[r'slot'] = null;
    }
    if (confirmations != null) {
      _json[r'confirmations'] = confirmations;
    } else {
      _json[r'confirmations'] = null;
    }
      _json[r'err'] = err;
      _json[r'confirmationStatus'] = confirmationStatus;
    return _json;
  }

  /// Returns a new [SignatureStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SignatureStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SignatureStatus[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SignatureStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SignatureStatus(
        slot: json[r'slot'] == null
            ? null
            : num.parse(json[r'slot'].toString()),
        confirmations: json[r'confirmations'] == null
            ? null
            : num.parse(json[r'confirmations'].toString()),
        err: mapValueOfType<Object>(json, r'err')!,
        confirmationStatus: mapValueOfType<Object>(json, r'confirmationStatus')!,
      );
    }
    return null;
  }

  static List<SignatureStatus>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SignatureStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SignatureStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SignatureStatus> mapFromJson(dynamic json) {
    final map = <String, SignatureStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignatureStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SignatureStatus-objects as value to a dart map
  static Map<String, List<SignatureStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SignatureStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SignatureStatus.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'err',
    'confirmationStatus',
  };
}

