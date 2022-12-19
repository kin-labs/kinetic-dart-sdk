//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CompiledInstruction {
  /// Returns a new [CompiledInstruction] instance.
  CompiledInstruction({
    required this.programIdIndex,
    this.accounts = const [],
    required this.data,
  });

  int programIdIndex;

  List<int> accounts;

  String data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CompiledInstruction &&
     other.programIdIndex == programIdIndex &&
     other.accounts == accounts &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (programIdIndex.hashCode) +
    (accounts.hashCode) +
    (data.hashCode);

  @override
  String toString() => 'CompiledInstruction[programIdIndex=$programIdIndex, accounts=$accounts, data=$data]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'programIdIndex'] = programIdIndex;
      _json[r'accounts'] = accounts;
      _json[r'data'] = data;
    return _json;
  }

  /// Returns a new [CompiledInstruction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CompiledInstruction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CompiledInstruction[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CompiledInstruction[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CompiledInstruction(
        programIdIndex: mapValueOfType<int>(json, r'programIdIndex')!,
        accounts: json[r'accounts'] is List
            ? (json[r'accounts'] as List).cast<int>()
            : const [],
        data: mapValueOfType<String>(json, r'data')!,
      );
    }
    return null;
  }

  static List<CompiledInstruction>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CompiledInstruction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CompiledInstruction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CompiledInstruction> mapFromJson(dynamic json) {
    final map = <String, CompiledInstruction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CompiledInstruction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CompiledInstruction-objects as value to a dart map
  static Map<String, List<CompiledInstruction>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CompiledInstruction>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CompiledInstruction.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'programIdIndex',
    'accounts',
    'data',
  };
}

