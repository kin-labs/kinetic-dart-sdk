//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TokenBalance {
  /// Returns a new [TokenBalance] instance.
  TokenBalance({
    required this.accountIndex,
    required this.mint,
    this.owner,
    required this.uiTokenAmount,
  });

  int accountIndex;

  String mint;

  String? owner;

  TokenAmount uiTokenAmount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenBalance &&
     other.accountIndex == accountIndex &&
     other.mint == mint &&
     other.owner == owner &&
     other.uiTokenAmount == uiTokenAmount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountIndex.hashCode) +
    (mint.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (uiTokenAmount.hashCode);

  @override
  String toString() => 'TokenBalance[accountIndex=$accountIndex, mint=$mint, owner=$owner, uiTokenAmount=$uiTokenAmount]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'accountIndex'] = accountIndex;
      _json[r'mint'] = mint;
    if (owner != null) {
      _json[r'owner'] = owner;
    } else {
      _json[r'owner'] = null;
    }
      _json[r'uiTokenAmount'] = uiTokenAmount;
    return _json;
  }

  /// Returns a new [TokenBalance] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TokenBalance? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TokenBalance[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TokenBalance[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TokenBalance(
        accountIndex: mapValueOfType<int>(json, r'accountIndex')!,
        mint: mapValueOfType<String>(json, r'mint')!,
        owner: mapValueOfType<String>(json, r'owner'),
        uiTokenAmount: TokenAmount.fromJson(json[r'uiTokenAmount'])!,
      );
    }
    return null;
  }

  static List<TokenBalance>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TokenBalance>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TokenBalance.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TokenBalance> mapFromJson(dynamic json) {
    final map = <String, TokenBalance>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenBalance.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TokenBalance-objects as value to a dart map
  static Map<String, List<TokenBalance>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TokenBalance>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenBalance.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'accountIndex',
    'mint',
    'uiTokenAmount',
  };
}

