//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppTransactionError {
  /// Returns a new [AppTransactionError] instance.
  AppTransactionError({
    required this.id,
    this.logs = const [],
    required this.message,
    required this.type,
    required this.instruction,
  });

  String id;

  List<String> logs;

  String message;

  AppTransactionErrorTypeEnum type;

  int instruction;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppTransactionError &&
     other.id == id &&
     other.logs == logs &&
     other.message == message &&
     other.type == type &&
     other.instruction == instruction;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (logs.hashCode) +
    (message.hashCode) +
    (type.hashCode) +
    (instruction.hashCode);

  @override
  String toString() => 'AppTransactionError[id=$id, logs=$logs, message=$message, type=$type, instruction=$instruction]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'id'] = id;
      _json[r'logs'] = logs;
      _json[r'message'] = message;
      _json[r'type'] = type;
      _json[r'instruction'] = instruction;
    return _json;
  }

  /// Returns a new [AppTransactionError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppTransactionError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppTransactionError[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppTransactionError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppTransactionError(
        id: mapValueOfType<String>(json, r'id')!,
        logs: json[r'logs'] is List
            ? (json[r'logs'] as List).cast<String>()
            : const [],
        message: mapValueOfType<String>(json, r'message')!,
        type: AppTransactionErrorTypeEnum.fromJson(json[r'type'])!,
        instruction: mapValueOfType<int>(json, r'instruction')!,
      );
    }
    return null;
  }

  static List<AppTransactionError>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppTransactionError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppTransactionError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppTransactionError> mapFromJson(dynamic json) {
    final map = <String, AppTransactionError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppTransactionError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppTransactionError-objects as value to a dart map
  static Map<String, List<AppTransactionError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppTransactionError>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppTransactionError.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'logs',
    'message',
    'type',
    'instruction',
  };
}


class AppTransactionErrorTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const AppTransactionErrorTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const badNonce = AppTransactionErrorTypeEnum._(r'BadNonce');
  static const invalidAccount = AppTransactionErrorTypeEnum._(r'InvalidAccount');
  static const someError = AppTransactionErrorTypeEnum._(r'SomeError');
  static const timeout = AppTransactionErrorTypeEnum._(r'Timeout');
  static const unknown = AppTransactionErrorTypeEnum._(r'Unknown');
  static const webhookFailed = AppTransactionErrorTypeEnum._(r'WebhookFailed');

  /// List of all possible values in this [enum][AppTransactionErrorTypeEnum].
  static const values = <AppTransactionErrorTypeEnum>[
    badNonce,
    invalidAccount,
    someError,
    timeout,
    unknown,
    webhookFailed,
  ];

  static AppTransactionErrorTypeEnum? fromJson(dynamic value) => AppTransactionErrorTypeEnumTypeTransformer().decode(value);

  static List<AppTransactionErrorTypeEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppTransactionErrorTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppTransactionErrorTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AppTransactionErrorTypeEnum] to String,
/// and [decode] dynamic data back to [AppTransactionErrorTypeEnum].
class AppTransactionErrorTypeEnumTypeTransformer {
  factory AppTransactionErrorTypeEnumTypeTransformer() => _instance ??= const AppTransactionErrorTypeEnumTypeTransformer._();

  const AppTransactionErrorTypeEnumTypeTransformer._();

  String encode(AppTransactionErrorTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AppTransactionErrorTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AppTransactionErrorTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'BadNonce': return AppTransactionErrorTypeEnum.badNonce;
        case r'InvalidAccount': return AppTransactionErrorTypeEnum.invalidAccount;
        case r'SomeError': return AppTransactionErrorTypeEnum.someError;
        case r'Timeout': return AppTransactionErrorTypeEnum.timeout;
        case r'Unknown': return AppTransactionErrorTypeEnum.unknown;
        case r'WebhookFailed': return AppTransactionErrorTypeEnum.webhookFailed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AppTransactionErrorTypeEnumTypeTransformer] instance.
  static AppTransactionErrorTypeEnumTypeTransformer? _instance;
}


