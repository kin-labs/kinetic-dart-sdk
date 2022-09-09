//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppConfigMint {
  /// Returns a new [AppConfigMint] instance.
  AppConfigMint({
    required this.addMemo,
    required this.airdrop,
    this.airdropAmount,
    this.airdropMax,
    required this.decimals,
    required this.feePayer,
    required this.logoUrl,
    required this.name,
    required this.programId,
    required this.publicKey,
    required this.symbol,
  });

  bool addMemo;

  bool airdrop;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? airdropAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? airdropMax;

  int decimals;

  String feePayer;

  String logoUrl;

  String name;

  String programId;

  String publicKey;

  String symbol;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppConfigMint &&
     other.addMemo == addMemo &&
     other.airdrop == airdrop &&
     other.airdropAmount == airdropAmount &&
     other.airdropMax == airdropMax &&
     other.decimals == decimals &&
     other.feePayer == feePayer &&
     other.logoUrl == logoUrl &&
     other.name == name &&
     other.programId == programId &&
     other.publicKey == publicKey &&
     other.symbol == symbol;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (addMemo.hashCode) +
    (airdrop.hashCode) +
    (airdropAmount == null ? 0 : airdropAmount!.hashCode) +
    (airdropMax == null ? 0 : airdropMax!.hashCode) +
    (decimals.hashCode) +
    (feePayer.hashCode) +
    (logoUrl.hashCode) +
    (name.hashCode) +
    (programId.hashCode) +
    (publicKey.hashCode) +
    (symbol.hashCode);

  @override
  String toString() => 'AppConfigMint[addMemo=$addMemo, airdrop=$airdrop, airdropAmount=$airdropAmount, airdropMax=$airdropMax, decimals=$decimals, feePayer=$feePayer, logoUrl=$logoUrl, name=$name, programId=$programId, publicKey=$publicKey, symbol=$symbol]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'addMemo'] = addMemo;
      _json[r'airdrop'] = airdrop;
    if (airdropAmount != null) {
      _json[r'airdropAmount'] = airdropAmount;
    } else {
      _json[r'airdropAmount'] = null;
    }
    if (airdropMax != null) {
      _json[r'airdropMax'] = airdropMax;
    } else {
      _json[r'airdropMax'] = null;
    }
      _json[r'decimals'] = decimals;
      _json[r'feePayer'] = feePayer;
      _json[r'logoUrl'] = logoUrl;
      _json[r'name'] = name;
      _json[r'programId'] = programId;
      _json[r'publicKey'] = publicKey;
      _json[r'symbol'] = symbol;
    return _json;
  }

  /// Returns a new [AppConfigMint] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppConfigMint? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppConfigMint[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppConfigMint[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppConfigMint(
        addMemo: mapValueOfType<bool>(json, r'addMemo')!,
        airdrop: mapValueOfType<bool>(json, r'airdrop')!,
        airdropAmount: mapValueOfType<int>(json, r'airdropAmount'),
        airdropMax: mapValueOfType<int>(json, r'airdropMax'),
        decimals: mapValueOfType<int>(json, r'decimals')!,
        feePayer: mapValueOfType<String>(json, r'feePayer')!,
        logoUrl: mapValueOfType<String>(json, r'logoUrl')!,
        name: mapValueOfType<String>(json, r'name')!,
        programId: mapValueOfType<String>(json, r'programId')!,
        publicKey: mapValueOfType<String>(json, r'publicKey')!,
        symbol: mapValueOfType<String>(json, r'symbol')!,
      );
    }
    return null;
  }

  static List<AppConfigMint>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppConfigMint>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppConfigMint.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppConfigMint> mapFromJson(dynamic json) {
    final map = <String, AppConfigMint>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfigMint.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppConfigMint-objects as value to a dart map
  static Map<String, List<AppConfigMint>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppConfigMint>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppConfigMint.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'addMemo',
    'airdrop',
    'decimals',
    'feePayer',
    'logoUrl',
    'name',
    'programId',
    'publicKey',
    'symbol',
  };
}

