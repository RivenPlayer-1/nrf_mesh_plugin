// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_on_off_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericOnOffStatusDataImpl _$$GenericOnOffStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericOnOffStatusDataImpl(
      (json['source'] as num).toInt(),
      json['presentState'] as bool,
      json['targetState'] as bool?,
      (json['transitionResolution'] as num).toInt(),
      (json['transitionSteps'] as num).toInt(),
    );

Map<String, dynamic> _$$GenericOnOffStatusDataImplToJson(
        _$GenericOnOffStatusDataImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'presentState': instance.presentState,
      'targetState': instance.targetState,
      'transitionResolution': instance.transitionResolution,
      'transitionSteps': instance.transitionSteps,
    };
