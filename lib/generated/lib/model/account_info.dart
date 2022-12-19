//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountInfo {
  /// Returns a new [AccountInfo] instance.
  AccountInfo({
    required this.account,
    required this.isMint,
    required this.isOwner,
    required this.isTokenAccount,
    this.owner,
    this.program,
    this.tokens = const [],
  });

  String account;

  bool isMint;

  bool isOwner;

  bool isTokenAccount;

  String? owner;

  String? program;

  List<TokenInfo>? tokens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountInfo &&
     other.account == account &&
     other.isMint == isMint &&
     other.isOwner == isOwner &&
     other.isTokenAccount == isTokenAccount &&
     other.owner == owner &&
     other.program == program &&
     other.tokens == tokens;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (account.hashCode) +
    (isMint.hashCode) +
    (isOwner.hashCode) +
    (isTokenAccount.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (program == null ? 0 : program!.hashCode) +
    (tokens == null ? 0 : tokens!.hashCode);

  @override
  String toString() => 'AccountInfo[account=$account, isMint=$isMint, isOwner=$isOwner, isTokenAccount=$isTokenAccount, owner=$owner, program=$program, tokens=$tokens]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'account'] = account;
      _json[r'isMint'] = isMint;
      _json[r'isOwner'] = isOwner;
      _json[r'isTokenAccount'] = isTokenAccount;
    if (owner != null) {
      _json[r'owner'] = owner;
    } else {
      _json[r'owner'] = null;
    }
    if (program != null) {
      _json[r'program'] = program;
    } else {
      _json[r'program'] = null;
    }
    if (tokens != null) {
      _json[r'tokens'] = tokens;
    } else {
      _json[r'tokens'] = null;
    }
    return _json;
  }

  /// Returns a new [AccountInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AccountInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AccountInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AccountInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AccountInfo(
        account: mapValueOfType<String>(json, r'account')!,
        isMint: mapValueOfType<bool>(json, r'isMint')!,
        isOwner: mapValueOfType<bool>(json, r'isOwner')!,
        isTokenAccount: mapValueOfType<bool>(json, r'isTokenAccount')!,
        owner: mapValueOfType<String>(json, r'owner'),
        program: mapValueOfType<String>(json, r'program'),
        tokens: TokenInfo.listFromJson(json[r'tokens']) ?? const [],
      );
    }
    return null;
  }

  static List<AccountInfo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AccountInfo> mapFromJson(dynamic json) {
    final map = <String, AccountInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AccountInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AccountInfo-objects as value to a dart map
  static Map<String, List<AccountInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AccountInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AccountInfo.listFromJson(entry.value, growable: growable,);
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
    'isMint',
    'isOwner',
    'isTokenAccount',
  };
}

