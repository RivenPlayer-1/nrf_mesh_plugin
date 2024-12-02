// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_lightness_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LightLightnessStatusDataImpl _$$LightLightnessStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LightLightnessStatusDataImpl(
      (json['presentLightness'] as num).toInt(),
      (json['targetLightness'] as num).toInt(),
      (json['transitionSteps'] as num).toInt(),
      (json['transitionResolution'] as num).toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$LightLightnessStatusDataImplToJson(
        _$LightLightnessStatusDataImpl instance) =>
    <String, dynamic>{
      'presentLightness': instance.presentLightness,
      'targetLightness': instance.targetLightness,
      'transitionSteps': instance.transitionSteps,
      'transitionResolution': instance.transitionResolution,
      'source': instance.source,
      'destination': instance.destination,
    };
