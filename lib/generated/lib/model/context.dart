//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Context {
  /// Returns a new [Context] instance.
  Context({
    this.slot,
  });

  int? slot;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Context &&
     other.slot == slot;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (slot == null ? 0 : slot!.hashCode);

  @override
  String toString() => 'Context[slot=$slot]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (slot != null) {
      _json[r'slot'] = slot;
    } else {
      _json[r'slot'] = null;
    }
    return _json;
  }

  /// Returns a new [Context] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Context? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Context[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Context[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Context(
        slot: mapValueOfType<int>(json, r'slot'),
      );
    }
    return null;
  }

  static List<Context>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Context>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Context.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Context> mapFromJson(dynamic json) {
    final map = <String, Context>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Context.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Context-objects as value to a dart map
  static Map<String, List<Context>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Context>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Context.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

