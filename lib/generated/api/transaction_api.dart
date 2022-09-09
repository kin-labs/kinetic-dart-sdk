//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TransactionApi {
  TransactionApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  Future<Response> getLatestBlockhashWithHttpInfo(String environment, int index,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/transaction/latest-blockhash/{environment}/{index}'
      .replaceAll('{environment}', environment)
      .replaceAll('{index}', index.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  Future<LatestBlockhashResponse?> getLatestBlockhash(String environment, int index,) async {
    final response = await getLatestBlockhashWithHttpInfo(environment, index,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LatestBlockhashResponse',) as LatestBlockhashResponse;
    
    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [int] dataLength (required):
  Future<Response> getMinimumRentExemptionBalanceWithHttpInfo(String environment, int index, int dataLength,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/transaction/minimum-rent-exemption-balance/{environment}/{index}'
      .replaceAll('{environment}', environment)
      .replaceAll('{index}', index.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'dataLength', dataLength));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [int] dataLength (required):
  Future<MinimumRentExemptionBalanceResponse?> getMinimumRentExemptionBalance(String environment, int index, int dataLength,) async {
    final response = await getMinimumRentExemptionBalanceWithHttpInfo(environment, index, dataLength,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MinimumRentExemptionBalanceResponse',) as MinimumRentExemptionBalanceResponse;
    
    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] signature (required):
  Future<Response> getTransactionWithHttpInfo(String environment, int index, String signature,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/transaction/transaction/{environment}/{index}/{signature}'
      .replaceAll('{environment}', environment)
      .replaceAll('{index}', index.toString())
      .replaceAll('{signature}', signature);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [String] environment (required):
  ///
  /// * [int] index (required):
  ///
  /// * [String] signature (required):
  Future<GetTransactionResponse?> getTransaction(String environment, int index, String signature,) async {
    final response = await getTransactionWithHttpInfo(environment, index, signature,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetTransactionResponse',) as GetTransactionResponse;
    
    }
    return null;
  }

  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MakeTransferRequest] makeTransferRequest (required):
  Future<Response> makeTransferWithHttpInfo(MakeTransferRequest makeTransferRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/transaction/make-transfer';

    // ignore: prefer_final_locals
    Object? postBody = makeTransferRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 
  ///
  /// Parameters:
  ///
  /// * [MakeTransferRequest] makeTransferRequest (required):
  Future<AppTransaction?> makeTransfer(MakeTransferRequest makeTransferRequest,) async {
    final response = await makeTransferWithHttpInfo(makeTransferRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AppTransaction',) as AppTransaction;
    
    }
    return null;
  }
}
