//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BalanceToken {
  /// Returns a new [BalanceToken] instance.
  BalanceToken({
    required this.account,
    required this.balance,
    required this.mint,
  });

  String account;

  String balance;

  String mint;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BalanceToken &&
     other.account == account &&
     other.balance == balance &&
     other.mint == mint;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (account.hashCode) +
    (balance.hashCode) +
    (mint.hashCode);

  @override
  String toString() => 'BalanceToken[account=$account, balance=$balance, mint=$mint]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'account'] = account;
      _json[r'balance'] = balance;
      _json[r'mint'] = mint;
    return _json;
  }

  /// Returns a new [BalanceToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BalanceToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BalanceToken[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BalanceToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BalanceToken(
        account: mapValueOfType<String>(json, r'account')!,
        balance: mapValueOfType<String>(json, r'balance')!,
        mint: mapValueOfType<String>(json, r'mint')!,
      );
    }
    return null;
  }

  static List<BalanceToken>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BalanceToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BalanceToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BalanceToken> mapFromJson(dynamic json) {
    final map = <String, BalanceToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BalanceToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BalanceToken-objects as value to a dart map
  static Map<String, List<BalanceToken>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BalanceToken>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BalanceToken.listFromJson(entry.value, growable: growable,);
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
    'balance',
    'mint',
  };
}

