// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_default_ttl_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigDefaultTtlStatusImpl _$$ConfigDefaultTtlStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigDefaultTtlStatusImpl(
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
      (json['ttl'] as num).toInt(),
    );

Map<String, dynamic> _$$ConfigDefaultTtlStatusImplToJson(
        _$ConfigDefaultTtlStatusImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'ttl': instance.ttl,
    };
