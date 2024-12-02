// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model_app_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigModelAppStatusDataImpl _$$ConfigModelAppStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigModelAppStatusDataImpl(
      (json['elementAddress'] as num).toInt(),
      (json['modelId'] as num).toInt(),
      (json['appKeyIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$ConfigModelAppStatusDataImplToJson(
        _$ConfigModelAppStatusDataImpl instance) =>
    <String, dynamic>{
      'elementAddress': instance.elementAddress,
      'modelId': instance.modelId,
      'appKeyIndex': instance.appKeyIndex,
    };
