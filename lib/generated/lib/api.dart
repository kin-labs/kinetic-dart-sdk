//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/account_api.dart';
part 'api/airdrop_api.dart';
part 'api/app_api.dart';
part 'api/transaction_api.dart';

part 'model/app_config.dart';
part 'model/app_config_api.dart';
part 'model/app_config_app.dart';
part 'model/app_config_cluster.dart';
part 'model/app_config_environment.dart';
part 'model/app_config_mint.dart';
part 'model/app_health.dart';
part 'model/balance_response.dart';
part 'model/balance_token.dart';
part 'model/confirmed_signature_info.dart';
part 'model/confirmed_transaction_meta.dart';
part 'model/create_account_request.dart';
part 'model/get_transaction_response.dart';
part 'model/history_response.dart';
part 'model/latest_blockhash_response.dart';
part 'model/make_transfer_request.dart';
part 'model/minimum_rent_exemption_balance_response.dart';
part 'model/request_airdrop_request.dart';
part 'model/request_airdrop_response.dart';
part 'model/signature_status.dart';
part 'model/transaction.dart';
part 'model/transaction_data.dart';
part 'model/transaction_error.dart';
part 'model/transaction_response.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
