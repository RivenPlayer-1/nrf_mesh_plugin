// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dooz_scenario_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoozScenarioStatusDataImpl _$$DoozScenarioStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DoozScenarioStatusDataImpl(
      (json['scenarioId'] as num).toInt(),
      (json['command'] as num).toInt(),
      (json['io'] as num).toInt(),
      json['isActive'] as bool,
      (json['unused'] as num).toInt(),
      (json['value'] as num).toInt(),
      (json['transition'] as num).toInt(),
      (json['startAt'] as num).toInt(),
      (json['duration'] as num).toInt(),
      (json['daysInWeek'] as num).toInt(),
      (json['correlation'] as num).toInt(),
      (json['extra'] as num).toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$DoozScenarioStatusDataImplToJson(
        _$DoozScenarioStatusDataImpl instance) =>
    <String, dynamic>{
      'scenarioId': instance.scenarioId,
      'command': instance.command,
      'io': instance.io,
      'isActive': instance.isActive,
      'unused': instance.unused,
      'value': instance.value,
      'transition': instance.transition,
      'startAt': instance.startAt,
      'duration': instance.duration,
      'daysInWeek': instance.daysInWeek,
      'correlation': instance.correlation,
      'extra': instance.extra,
      'source': instance.source,
      'destination': instance.destination,
    };
