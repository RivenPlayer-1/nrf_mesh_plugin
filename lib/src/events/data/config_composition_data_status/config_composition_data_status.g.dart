// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_composition_data_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigCompositionDataStatusDataImpl
    _$$ConfigCompositionDataStatusDataImplFromJson(Map json) =>
        _$ConfigCompositionDataStatusDataImpl(
          (json['source'] as num).toInt(),
          ConfigCompositionDataStatusMeshMessage.fromJson(
              Map<String, dynamic>.from(json['meshMessage'] as Map)),
        );

Map<String, dynamic> _$$ConfigCompositionDataStatusDataImplToJson(
        _$ConfigCompositionDataStatusDataImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'meshMessage': instance.meshMessage,
    };

_$ConfigCompositionDataStatusMeshMessageImpl
    _$$ConfigCompositionDataStatusMeshMessageImplFromJson(
            Map<String, dynamic> json) =>
        _$ConfigCompositionDataStatusMeshMessageImpl(
          (json['source'] as num).toInt(),
          (json['aszmic'] as num?)?.toInt(),
          (json['destination'] as num).toInt(),
        );

Map<String, dynamic> _$$ConfigCompositionDataStatusMeshMessageImplToJson(
        _$ConfigCompositionDataStatusMeshMessageImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'aszmic': instance.aszmic,
      'destination': instance.destination,
    };
