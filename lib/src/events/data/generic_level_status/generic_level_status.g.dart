// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_level_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericLevelStatusDataImpl _$$GenericLevelStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericLevelStatusDataImpl(
      (json['level'] as num).toInt(),
      (json['targetLevel'] as num?)?.toInt(),
      (json['transitionSteps'] as num?)?.toInt(),
      (json['transitionResolution'] as num?)?.toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$GenericLevelStatusDataImplToJson(
        _$GenericLevelStatusDataImpl instance) =>
    <String, dynamic>{
      'level': instance.level,
      'targetLevel': instance.targetLevel,
      'transitionSteps': instance.transitionSteps,
      'transitionResolution': instance.transitionResolution,
      'source': instance.source,
      'destination': instance.destination,
    };
