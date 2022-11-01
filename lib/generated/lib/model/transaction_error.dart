//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TransactionError {
  /// Returns a new [TransactionError] instance.
  TransactionError({
    required this.id,
    this.logs = const [],
    required this.message,
    required this.type,
    required this.instruction,
  });

  String id;

  List<String> logs;

  String message;

  TransactionErrorType type;

  int instruction;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TransactionError &&
     other.id == id &&
     other.logs == logs &&
     other.message == message &&
     other.type == type &&
     other.instruction == instruction;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (logs.hashCode) +
    (message.hashCode) +
    (type.hashCode) +
    (instruction.hashCode);

  @override
  String toString() => 'TransactionError[id=$id, logs=$logs, message=$message, type=$type, instruction=$instruction]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'id'] = id;
      _json[r'logs'] = logs;
      _json[r'message'] = message;
      _json[r'type'] = type;
      _json[r'instruction'] = instruction;
    return _json;
  }

  /// Returns a new [TransactionError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TransactionError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TransactionError[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TransactionError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TransactionError(
        id: mapValueOfType<String>(json, r'id')!,
        logs: json[r'logs'] is List
            ? (json[r'logs'] as List).cast<String>()
            : const [],
        message: mapValueOfType<String>(json, r'message')!,
        type: TransactionErrorType.fromJson(json[r'type'])!,
        instruction: mapValueOfType<int>(json, r'instruction')!,
      );
    }
    return null;
  }

  static List<TransactionError>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransactionError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransactionError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TransactionError> mapFromJson(dynamic json) {
    final map = <String, TransactionError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TransactionError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TransactionError-objects as value to a dart map
  static Map<String, List<TransactionError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TransactionError>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TransactionError.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'logs',
    'message',
    'type',
    'instruction',
  };
}

