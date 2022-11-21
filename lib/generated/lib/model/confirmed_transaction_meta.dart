//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConfirmedTransactionMeta {
  /// Returns a new [ConfirmedTransactionMeta] instance.
  ConfirmedTransactionMeta({
    this.fee,
    this.innerInstructions = const [],
    this.preBalances = const [],
    this.postBalances = const [],
    this.logMessages = const [],
    this.preTokenBalances = const [],
    this.postTokenBalances = const [],
    this.err,
  });

  num? fee;

  List<String>? innerInstructions;

  List<int>? preBalances;

  List<int> postBalances;

  List<String>? logMessages;

  List<String>? preTokenBalances;

  List<String>? postTokenBalances;

  Object? err;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConfirmedTransactionMeta &&
     other.fee == fee &&
     other.innerInstructions == innerInstructions &&
     other.preBalances == preBalances &&
     other.postBalances == postBalances &&
     other.logMessages == logMessages &&
     other.preTokenBalances == preTokenBalances &&
     other.postTokenBalances == postTokenBalances &&
     other.err == err;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fee == null ? 0 : fee!.hashCode) +
    (innerInstructions == null ? 0 : innerInstructions!.hashCode) +
    (preBalances == null ? 0 : preBalances!.hashCode) +
    (postBalances.hashCode) +
    (logMessages == null ? 0 : logMessages!.hashCode) +
    (preTokenBalances == null ? 0 : preTokenBalances!.hashCode) +
    (postTokenBalances == null ? 0 : postTokenBalances!.hashCode) +
    (err == null ? 0 : err!.hashCode);

  @override
  String toString() => 'ConfirmedTransactionMeta[fee=$fee, innerInstructions=$innerInstructions, preBalances=$preBalances, postBalances=$postBalances, logMessages=$logMessages, preTokenBalances=$preTokenBalances, postTokenBalances=$postTokenBalances, err=$err]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (fee != null) {
      _json[r'fee'] = fee;
    } else {
      _json[r'fee'] = null;
    }
    if (innerInstructions != null) {
      _json[r'innerInstructions'] = innerInstructions;
    } else {
      _json[r'innerInstructions'] = null;
    }
    if (preBalances != null) {
      _json[r'preBalances'] = preBalances;
    } else {
      _json[r'preBalances'] = null;
    }
      _json[r'postBalances'] = postBalances;
    if (logMessages != null) {
      _json[r'logMessages'] = logMessages;
    } else {
      _json[r'logMessages'] = null;
    }
    if (preTokenBalances != null) {
      _json[r'preTokenBalances'] = preTokenBalances;
    } else {
      _json[r'preTokenBalances'] = null;
    }
    if (postTokenBalances != null) {
      _json[r'postTokenBalances'] = postTokenBalances;
    } else {
      _json[r'postTokenBalances'] = null;
    }
    if (err != null) {
      _json[r'err'] = err;
    } else {
      _json[r'err'] = null;
    }
    return _json;
  }

  /// Returns a new [ConfirmedTransactionMeta] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConfirmedTransactionMeta? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ConfirmedTransactionMeta[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ConfirmedTransactionMeta[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConfirmedTransactionMeta(
        fee: json[r'fee'] == null
            ? null
            : num.parse(json[r'fee'].toString()),
        innerInstructions: json[r'innerInstructions'] is List
            ? (json[r'innerInstructions'] as List).cast<String>()
            : const [],
        preBalances: json[r'preBalances'] is List
            ? (json[r'preBalances'] as List).cast<int>()
            : const [],
        postBalances: json[r'postBalances'] is List
            ? (json[r'postBalances'] as List).cast<int>()
            : const [],
        logMessages: json[r'logMessages'] is List
            ? (json[r'logMessages'] as List).cast<String>()
            : const [],
        preTokenBalances: json[r'preTokenBalances'] is List
            ? (json[r'preTokenBalances'] as List).cast<String>()
            : const [],
        postTokenBalances: json[r'postTokenBalances'] is List
            ? (json[r'postTokenBalances'] as List).cast<String>()
            : const [],
        err: mapValueOfType<Object>(json, r'err'),
      );
    }
    return null;
  }

  static List<ConfirmedTransactionMeta>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConfirmedTransactionMeta>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConfirmedTransactionMeta.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConfirmedTransactionMeta> mapFromJson(dynamic json) {
    final map = <String, ConfirmedTransactionMeta>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConfirmedTransactionMeta.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConfirmedTransactionMeta-objects as value to a dart map
  static Map<String, List<ConfirmedTransactionMeta>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConfirmedTransactionMeta>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConfirmedTransactionMeta.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'postBalances',
  };
}

