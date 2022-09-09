# openapi.api.AccountApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devnet.kinetic.kin.org*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAccount**](AccountApi.md#createaccount) | **POST** /api/account/create | 
[**getAccountInfo**](AccountApi.md#getaccountinfo) | **GET** /api/account/info/{environment}/{index}/{accountId} | 
[**getBalance**](AccountApi.md#getbalance) | **GET** /api/account/balance/{environment}/{index}/{accountId} | 
[**getHistory**](AccountApi.md#gethistory) | **GET** /api/account/history/{environment}/{index}/{accountId}/{mint} | 
[**getTokenAccounts**](AccountApi.md#gettokenaccounts) | **GET** /api/account/token-accounts/{environment}/{index}/{accountId}/{mint} | 


# **createAccount**
> AppTransaction createAccount(createAccountRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AccountApi();
final createAccountRequest = CreateAccountRequest(); // CreateAccountRequest | 

try {
    final result = api_instance.createAccount(createAccountRequest);
    print(result);
} catch (e) {
    print('Exception when calling AccountApi->createAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAccountRequest** | [**CreateAccountRequest**](CreateAccountRequest.md)|  | 

### Return type

[**AppTransaction**](AppTransaction.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountInfo**
> getAccountInfo(environment, index, accountId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AccountApi();
final environment = environment_example; // String | 
final index = 56; // int | 
final accountId = accountId_example; // String | 

try {
    api_instance.getAccountInfo(environment, index, accountId);
} catch (e) {
    print('Exception when calling AccountApi->getAccountInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 
 **accountId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBalance**
> BalanceResponse getBalance(environment, index, accountId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AccountApi();
final environment = environment_example; // String | 
final index = 56; // int | 
final accountId = accountId_example; // String | 

try {
    final result = api_instance.getBalance(environment, index, accountId);
    print(result);
} catch (e) {
    print('Exception when calling AccountApi->getBalance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 
 **accountId** | **String**|  | 

### Return type

[**BalanceResponse**](BalanceResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHistory**
> List<HistoryResponse> getHistory(environment, index, accountId, mint)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AccountApi();
final environment = environment_example; // String | 
final index = 56; // int | 
final accountId = accountId_example; // String | 
final mint = mint_example; // String | 

try {
    final result = api_instance.getHistory(environment, index, accountId, mint);
    print(result);
} catch (e) {
    print('Exception when calling AccountApi->getHistory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 
 **accountId** | **String**|  | 
 **mint** | **String**|  | 

### Return type

[**List<HistoryResponse>**](HistoryResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTokenAccounts**
> List<String> getTokenAccounts(environment, index, accountId, mint)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AccountApi();
final environment = environment_example; // String | 
final index = 56; // int | 
final accountId = accountId_example; // String | 
final mint = mint_example; // String | 

try {
    final result = api_instance.getTokenAccounts(environment, index, accountId, mint);
    print(result);
} catch (e) {
    print('Exception when calling AccountApi->getTokenAccounts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 
 **accountId** | **String**|  | 
 **mint** | **String**|  | 

### Return type

**List<String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

