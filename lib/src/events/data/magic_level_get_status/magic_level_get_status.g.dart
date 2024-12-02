// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magic_level_get_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MagicLevelGetStatusDataImpl _$$MagicLevelGetStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MagicLevelGetStatusDataImpl(
      (json['io'] as num).toInt(),
      (json['index'] as num).toInt(),
      (json['value'] as num).toInt(),
      (json['correlation'] as num).toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$MagicLevelGetStatusDataImplToJson(
        _$MagicLevelGetStatusDataImpl instance) =>
    <String, dynamic>{
      'io': instance.io,
      'index': instance.index,
      'value': instance.value,
      'correlation': instance.correlation,
      'source': instance.source,
      'destination': instance.destination,
    };
