# openapi.model.AppTransaction

## Load the model package
```dart
import 'package:openapi/kinetic_sdk_internal.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 
**amount** | **String** |  | 
**decimals** | **num** |  | 
**destination** | **String** |  | 
**errors** | [**List<AppTransactionError>**](AppTransactionError.md) |  | [default to const []]
**explorerUrl** | **String** |  | 
**feePayer** | **String** |  | 
**ip** | **String** |  | 
**mint** | **String** |  | 
**processingDuration** | **num** |  | 
**referenceId** | **String** |  | 
**referenceType** | **String** |  | 
**signature** | **String** |  | 
**solanaCommitted** | [**DateTime**](DateTime.md) |  | 
**solanaCommittedDuration** | **num** |  | 
**solanaFinalized** | [**DateTime**](DateTime.md) |  | 
**solanaFinalizedDuration** | **num** |  | 
**solanaStart** | [**DateTime**](DateTime.md) |  | 
**solanaTransaction** | [**Object**](.md) |  | 
**source_** | **String** |  | 
**status** | **String** |  | 
**totalDuration** | **num** |  | 
**ua** | **String** |  | 
**webhookEventStart** | [**DateTime**](DateTime.md) |  | 
**webhookEventEnd** | [**DateTime**](DateTime.md) |  | 
**webhookEventDuration** | **num** |  | 
**webhookVerifyStart** | [**DateTime**](DateTime.md) |  | 
**webhookVerifyEnd** | [**DateTime**](DateTime.md) |  | 
**webhookVerifyDuration** | **num** |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


