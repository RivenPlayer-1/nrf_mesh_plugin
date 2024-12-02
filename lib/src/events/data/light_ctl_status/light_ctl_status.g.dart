// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_ctl_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LightCtlStatusDataImpl _$$LightCtlStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LightCtlStatusDataImpl(
      (json['presentLightness'] as num).toInt(),
      (json['targetLightness'] as num).toInt(),
      (json['presentTemperature'] as num).toInt(),
      (json['targetTemperature'] as num).toInt(),
      (json['transitionSteps'] as num).toInt(),
      (json['transitionResolution'] as num).toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$LightCtlStatusDataImplToJson(
        _$LightCtlStatusDataImpl instance) =>
    <String, dynamic>{
      'presentLightness': instance.presentLightness,
      'targetLightness': instance.targetLightness,
      'presentTemperature': instance.presentTemperature,
      'targetTemperature': instance.targetTemperature,
      'transitionSteps': instance.transitionSteps,
      'transitionResolution': instance.transitionResolution,
      'source': instance.source,
      'destination': instance.destination,
    };
