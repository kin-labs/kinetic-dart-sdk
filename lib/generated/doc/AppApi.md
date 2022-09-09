# openapi.api.AppApi

## Load the API package
```dart
import 'package:openapi/kinetic_sdk_internal.dart';
```

All URIs are relative to *https://devnet.kinetic.kin.org*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAppConfig**](AppApi.md#getappconfig) | **GET** /api/app/{environment}/{index}/config | 
[**getAppHealth**](AppApi.md#getapphealth) | **GET** /api/app/{environment}/{index}/health | 


# **getAppConfig**
> AppConfig getAppConfig(environment, index)



### Example
```dart
import 'package:openapi/kinetic_sdk_internal.dart';

final api_instance = AppApi();
final environment = environment_example; // String | 
final index = 56; // int | 

try {
    final result = api_instance.getAppConfig(environment, index);
    print(result);
} catch (e) {
    print('Exception when calling AppApi->getAppConfig: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 

### Return type

[**AppConfig**](AppConfig.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAppHealth**
> AppHealth getAppHealth(environment, index)



### Example
```dart
import 'package:openapi/kinetic_sdk_internal.dart';

final api_instance = AppApi();
final environment = environment_example; // String | 
final index = 56; // int | 

try {
    final result = api_instance.getAppHealth(environment, index);
    print(result);
} catch (e) {
    print('Exception when calling AppApi->getAppHealth: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | **String**|  | 
 **index** | **int**|  | 

### Return type

[**AppHealth**](AppHealth.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

