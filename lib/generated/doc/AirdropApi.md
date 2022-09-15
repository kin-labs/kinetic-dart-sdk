# openapi.api.AirdropApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**requestAirdrop**](AirdropApi.md#requestairdrop) | **POST** /api/airdrop | 


# **requestAirdrop**
> RequestAirdropResponse requestAirdrop(requestAirdropRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AirdropApi();
final requestAirdropRequest = RequestAirdropRequest(); // RequestAirdropRequest | 

try {
    final result = api_instance.requestAirdrop(requestAirdropRequest);
    print(result);
} catch (e) {
    print('Exception when calling AirdropApi->requestAirdrop: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestAirdropRequest** | [**RequestAirdropRequest**](RequestAirdropRequest.md)|  | 

### Return type

[**RequestAirdropResponse**](RequestAirdropResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

