//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TokenAmount {
  /// Returns a new [TokenAmount] instance.
  TokenAmount({
    required this.amount,
    required this.decimals,
    this.uiAmount,
    this.uiAmountString,
  });

  String amount;

  int decimals;

  int? uiAmount;

  String? uiAmountString;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenAmount &&
     other.amount == amount &&
     other.decimals == decimals &&
     other.uiAmount == uiAmount &&
     other.uiAmountString == uiAmountString;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount.hashCode) +
    (decimals.hashCode) +
    (uiAmount == null ? 0 : uiAmount!.hashCode) +
    (uiAmountString == null ? 0 : uiAmountString!.hashCode);

  @override
  String toString() => 'TokenAmount[amount=$amount, decimals=$decimals, uiAmount=$uiAmount, uiAmountString=$uiAmountString]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'amount'] = amount;
      _json[r'decimals'] = decimals;
    if (uiAmount != null) {
      _json[r'uiAmount'] = uiAmount;
    } else {
      _json[r'uiAmount'] = null;
    }
    if (uiAmountString != null) {
      _json[r'uiAmountString'] = uiAmountString;
    } else {
      _json[r'uiAmountString'] = null;
    }
    return _json;
  }

  /// Returns a new [TokenAmount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TokenAmount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TokenAmount[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TokenAmount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TokenAmount(
        amount: mapValueOfType<String>(json, r'amount')!,
        decimals: mapValueOfType<int>(json, r'decimals')!,
        uiAmount: mapValueOfType<int>(json, r'uiAmount'),
        uiAmountString: mapValueOfType<String>(json, r'uiAmountString'),
      );
    }
    return null;
  }

  static List<TokenAmount>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TokenAmount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TokenAmount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TokenAmount> mapFromJson(dynamic json) {
    final map = <String, TokenAmount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenAmount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TokenAmount-objects as value to a dart map
  static Map<String, List<TokenAmount>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TokenAmount>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenAmount.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'amount',
    'decimals',
  };
}

