// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_key_refresh_phase_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigKeyRefreshPhaseStatusImpl _$$ConfigKeyRefreshPhaseStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigKeyRefreshPhaseStatusImpl(
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
      (json['statusCode'] as num).toInt(),
      json['statusCodeName'] as String,
      (json['netKeyIndex'] as num).toInt(),
      (json['transition'] as num).toInt(),
    );

Map<String, dynamic> _$$ConfigKeyRefreshPhaseStatusImplToJson(
        _$ConfigKeyRefreshPhaseStatusImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'statusCode': instance.statusCode,
      'statusCodeName': instance.statusCodeName,
      'netKeyIndex': instance.netKeyIndex,
      'transition': instance.transition,
    };
