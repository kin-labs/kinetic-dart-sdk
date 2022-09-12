//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class HistoryResponse {
  /// Returns a new [HistoryResponse] instance.
  HistoryResponse({
    required this.account,
    this.history = const [],
  });

  String account;

  List<ConfirmedSignatureInfo> history;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HistoryResponse &&
     other.account == account &&
     other.history == history;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (account.hashCode) +
    (history.hashCode);

  @override
  String toString() => 'HistoryResponse[account=$account, history=$history]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'account'] = account;
      _json[r'history'] = history;
    return _json;
  }

  /// Returns a new [HistoryResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static HistoryResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "HistoryResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "HistoryResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return HistoryResponse(
        account: mapValueOfType<String>(json, r'account')!,
        history: ConfirmedSignatureInfo.listFromJson(json[r'history'])!,
      );
    }
    return null;
  }

  static List<HistoryResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <HistoryResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = HistoryResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, HistoryResponse> mapFromJson(dynamic json) {
    final map = <String, HistoryResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = HistoryResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of HistoryResponse-objects as value to a dart map
  static Map<String, List<HistoryResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<HistoryResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = HistoryResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'account',
    'history',
  };
}

