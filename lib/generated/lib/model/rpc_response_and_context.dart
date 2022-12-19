//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RpcResponseAndContext {
  /// Returns a new [RpcResponseAndContext] instance.
  RpcResponseAndContext({
    required this.context,
    required this.value,
  });

  Context context;

  SignatureStatus value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RpcResponseAndContext &&
     other.context == context &&
     other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (context.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'RpcResponseAndContext[context=$context, value=$value]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'context'] = context;
      _json[r'value'] = value;
    return _json;
  }

  /// Returns a new [RpcResponseAndContext] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RpcResponseAndContext? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RpcResponseAndContext[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RpcResponseAndContext[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RpcResponseAndContext(
        context: Context.fromJson(json[r'context'])!,
        value: SignatureStatus.fromJson(json[r'value'])!,
      );
    }
    return null;
  }

  static List<RpcResponseAndContext>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RpcResponseAndContext>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RpcResponseAndContext.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RpcResponseAndContext> mapFromJson(dynamic json) {
    final map = <String, RpcResponseAndContext>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RpcResponseAndContext.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RpcResponseAndContext-objects as value to a dart map
  static Map<String, List<RpcResponseAndContext>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RpcResponseAndContext>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RpcResponseAndContext.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'context',
    'value',
  };
}

