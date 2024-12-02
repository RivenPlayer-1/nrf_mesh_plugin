// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_app_key_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigAppKeyStatusDataImpl _$$ConfigAppKeyStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigAppKeyStatusDataImpl(
      (json['source'] as num).toInt(),
    );

Map<String, dynamic> _$$ConfigAppKeyStatusDataImplToJson(
        _$ConfigAppKeyStatusDataImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
    };

_$ConfigAppKeyStatusMeshMessageImpl
    _$$ConfigAppKeyStatusMeshMessageImplFromJson(Map<String, dynamic> json) =>
        _$ConfigAppKeyStatusMeshMessageImpl(
          (json['source'] as num).toInt(),
          (json['destination'] as num).toInt(),
        );

Map<String, dynamic> _$$ConfigAppKeyStatusMeshMessageImplToJson(
        _$ConfigAppKeyStatusMeshMessageImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };
