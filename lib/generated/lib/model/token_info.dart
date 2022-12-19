//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TokenInfo {
  /// Returns a new [TokenInfo] instance.
  TokenInfo({
    required this.account,
    this.balance,
    this.closeAuthority,
    required this.decimals,
    required this.mint,
    this.owner,
  });

  String account;

  String? balance;

  String? closeAuthority;

  int decimals;

  String mint;

  String? owner;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenInfo &&
     other.account == account &&
     other.balance == balance &&
     other.closeAuthority == closeAuthority &&
     other.decimals == decimals &&
     other.mint == mint &&
     other.owner == owner;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (account.hashCode) +
    (balance == null ? 0 : balance!.hashCode) +
    (closeAuthority == null ? 0 : closeAuthority!.hashCode) +
    (decimals.hashCode) +
    (mint.hashCode) +
    (owner == null ? 0 : owner!.hashCode);

  @override
  String toString() => 'TokenInfo[account=$account, balance=$balance, closeAuthority=$closeAuthority, decimals=$decimals, mint=$mint, owner=$owner]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'account'] = account;
    if (balance != null) {
      _json[r'balance'] = balance;
    } else {
      _json[r'balance'] = null;
    }
    if (closeAuthority != null) {
      _json[r'closeAuthority'] = closeAuthority;
    } else {
      _json[r'closeAuthority'] = null;
    }
      _json[r'decimals'] = decimals;
      _json[r'mint'] = mint;
    if (owner != null) {
      _json[r'owner'] = owner;
    } else {
      _json[r'owner'] = null;
    }
    return _json;
  }

  /// Returns a new [TokenInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TokenInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TokenInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TokenInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TokenInfo(
        account: mapValueOfType<String>(json, r'account')!,
        balance: mapValueOfType<String>(json, r'balance'),
        closeAuthority: mapValueOfType<String>(json, r'closeAuthority'),
        decimals: mapValueOfType<int>(json, r'decimals')!,
        mint: mapValueOfType<String>(json, r'mint')!,
        owner: mapValueOfType<String>(json, r'owner'),
      );
    }
    return null;
  }

  static List<TokenInfo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TokenInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TokenInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TokenInfo> mapFromJson(dynamic json) {
    final map = <String, TokenInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TokenInfo-objects as value to a dart map
  static Map<String, List<TokenInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TokenInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TokenInfo.listFromJson(entry.value, growable: growable,);
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
    'decimals',
    'mint',
  };
}

