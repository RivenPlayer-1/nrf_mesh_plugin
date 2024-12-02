// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_hsl_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LightHslStatusDataImpl _$$LightHslStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LightHslStatusDataImpl(
      (json['presentLightness'] as num).toInt(),
      (json['presentHue'] as num).toInt(),
      (json['presentSaturation'] as num).toInt(),
      (json['transitionSteps'] as num).toInt(),
      (json['transitionResolution'] as num).toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$LightHslStatusDataImplToJson(
        _$LightHslStatusDataImpl instance) =>
    <String, dynamic>{
      'presentLightness': instance.presentLightness,
      'presentHue': instance.presentHue,
      'presentSaturation': instance.presentSaturation,
      'transitionSteps': instance.transitionSteps,
      'transitionResolution': instance.transitionResolution,
      'source': instance.source,
      'destination': instance.destination,
    };
