// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model_subscription_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigModelSubscriptionStatusImpl
    _$$ConfigModelSubscriptionStatusImplFromJson(Map<String, dynamic> json) =>
        _$ConfigModelSubscriptionStatusImpl(
          (json['source'] as num).toInt(),
          (json['destination'] as num).toInt(),
          (json['elementAddress'] as num).toInt(),
          (json['subscriptionAddress'] as num).toInt(),
          (json['modelIdentifier'] as num).toInt(),
          json['isSuccessful'] as bool,
        );

Map<String, dynamic> _$$ConfigModelSubscriptionStatusImplToJson(
        _$ConfigModelSubscriptionStatusImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'elementAddress': instance.elementAddress,
      'subscriptionAddress': instance.subscriptionAddress,
      'modelIdentifier': instance.modelIdentifier,
      'isSuccessful': instance.isSuccessful,
    };
