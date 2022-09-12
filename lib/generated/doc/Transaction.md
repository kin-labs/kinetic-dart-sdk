# openapi.model.Transaction

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**amount** | **String** |  | [optional] 
**decimals** | **num** |  | [optional] 
**destination** | **String** |  | [optional] 
**errors** | [**List<TransactionError>**](TransactionError.md) |  | [optional] [default to const []]
**explorerUrl** | **String** |  | [optional] 
**feePayer** | **String** |  | [optional] 
**ip** | **String** |  | [optional] 
**mint** | **String** |  | [optional] 
**processingDuration** | **num** |  | [optional] 
**referenceId** | **String** |  | [optional] 
**referenceType** | **String** |  | [optional] 
**signature** | **String** |  | [optional] 
**solanaCommitted** | [**DateTime**](DateTime.md) |  | [optional] 
**solanaCommittedDuration** | **num** |  | [optional] 
**solanaFinalized** | [**DateTime**](DateTime.md) |  | [optional] 
**solanaFinalizedDuration** | **num** |  | [optional] 
**solanaStart** | [**DateTime**](DateTime.md) |  | [optional] 
**solanaTransaction** | [**Object**](.md) |  | [optional] 
**source_** | **String** |  | [optional] 
**status** | **String** |  | [optional] 
**totalDuration** | **num** |  | [optional] 
**ua** | **String** |  | [optional] 
**webhookEventStart** | [**DateTime**](DateTime.md) |  | [optional] 
**webhookEventEnd** | [**DateTime**](DateTime.md) |  | [optional] 
**webhookEventDuration** | **num** |  | [optional] 
**webhookVerifyStart** | [**DateTime**](DateTime.md) |  | [optional] 
**webhookVerifyEnd** | [**DateTime**](DateTime.md) |  | [optional] 
**webhookVerifyDuration** | **num** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


