//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TransactionData {
  /// Returns a new [TransactionData] instance.
  TransactionData({
    required this.message,
    this.signatures = const [],
  });

  Object message;

  List<String> signatures;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TransactionData &&
     other.message == message &&
     other.signatures == signatures;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message.hashCode) +
    (signatures.hashCode);

  @override
  String toString() => 'TransactionData[message=$message, signatures=$signatures]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'message'] = message;
      _json[r'signatures'] = signatures;
    return _json;
  }

  /// Returns a new [TransactionData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TransactionData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TransactionData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TransactionData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TransactionData(
        message: mapValueOfType<Object>(json, r'message')!,
        signatures: json[r'signatures'] is List
            ? (json[r'signatures'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<TransactionData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransactionData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransactionData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TransactionData> mapFromJson(dynamic json) {
    final map = <String, TransactionData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TransactionData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TransactionData-objects as value to a dart map
  static Map<String, List<TransactionData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TransactionData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TransactionData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'signatures',
  };
}

