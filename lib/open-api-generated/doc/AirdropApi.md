# openapi.api.AirdropApi

## Load the API package
```dart
import 'package:openapi/kinetic_sdk_internal.dart';
```

All URIs are relative to *https://sandbox.kinetic.host*

Method | HTTP request | Description
------------- | ------------- | -------------
[**airdropStats**](AirdropApi.md#airdropstats) | **GET** /api/airdrop/stats | 
[**requestAirdrop**](AirdropApi.md#requestairdrop) | **POST** /api/airdrop | 


# **airdropStats**
> AirdropStats airdropStats()



### Example
```dart
import 'package:openapi/kinetic_sdk_internal.dart';

final api_instance = AirdropApi();

try {
    final result = api_instance.airdropStats();
    print(result);
} catch (e) {
    print('Exception when calling AirdropApi->airdropStats: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AirdropStats**](AirdropStats.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestAirdrop**
> RequestAirdropResponse requestAirdrop(requestAirdropRequest)



### Example
```dart
import 'package:openapi/kinetic_sdk_internal.dart';

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

