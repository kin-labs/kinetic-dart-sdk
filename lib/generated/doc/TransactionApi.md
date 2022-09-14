# openapi.api.TransactionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getLatestBlockhash**](TransactionApi.md#getlatestblockhash) | **GET** /api/transaction/latest-blockhash/{environment}/{index} | 
[**getMinimumRentExemptionBalance**](TransactionApi.md#getminimumrentexemptionbalance) | **GET** /api/transaction/minimum-rent-exemption-balance/{environment}/{index} | 
[**getTransaction**](TransactionApi.md#gettransaction) | **GET** /api/transaction/transaction/{environment}/{index}/{signature} | 
[**makeTransfer**](TransactionApi.md#maketransfer) | **POST** /api/transaction/make-transfer | 


# **getLatestBlockhash**
> LatestBlockhashResponse getLatestBlockhash(environment, index)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TransactionApi();
final environment = environment_example; // String | 
final index = 56; // int | 

try {
    final result = api_instance.getLatestBlockhash(environment, index);
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->getLatestBlockhash: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 

### Return type

[**LatestBlockhashResponse**](LatestBlockhashResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMinimumRentExemptionBalance**
> MinimumRentExemptionBalanceResponse getMinimumRentExemptionBalance(environment, index, dataLength)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TransactionApi();
final environment = environment_example; // String | 
final index = 56; // int | 
final dataLength = 56; // int | 

try {
    final result = api_instance.getMinimumRentExemptionBalance(environment, index, dataLength);
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->getMinimumRentExemptionBalance: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 
 **dataLength** | **int**|  | 

### Return type

[**MinimumRentExemptionBalanceResponse**](MinimumRentExemptionBalanceResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTransaction**
> GetTransactionResponse getTransaction(environment, index, signature)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TransactionApi();
final environment = environment_example; // String | 
final index = 56; // int | 
final signature = signature_example; // String | 

try {
    final result = api_instance.getTransaction(environment, index, signature);
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->getTransaction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 
 **signature** | **String**|  | 

### Return type

[**GetTransactionResponse**](GetTransactionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **makeTransfer**
> Transaction makeTransfer(makeTransferRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TransactionApi();
final makeTransferRequest = MakeTransferRequest(); // MakeTransferRequest | 

try {
    final result = api_instance.makeTransfer(makeTransferRequest);
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->makeTransfer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **makeTransferRequest** | [**MakeTransferRequest**](MakeTransferRequest.md)|  | 

### Return type

[**Transaction**](Transaction.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

