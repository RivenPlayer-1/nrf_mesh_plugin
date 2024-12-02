// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magic_level_set_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MagicLevelSetStatusDataImpl _$$MagicLevelSetStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MagicLevelSetStatusDataImpl(
      (json['io'] as num).toInt(),
      (json['index'] as num).toInt(),
      (json['value'] as num).toInt(),
      (json['correlation'] as num).toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$MagicLevelSetStatusDataImplToJson(
        _$MagicLevelSetStatusDataImpl instance) =>
    <String, dynamic>{
      'io': instance.io,
      'index': instance.index,
      'value': instance.value,
      'correlation': instance.correlation,
      'source': instance.source,
      'destination': instance.destination,
    };
