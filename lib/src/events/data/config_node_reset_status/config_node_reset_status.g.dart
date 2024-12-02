// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_node_reset_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigNodeResetStatusImpl _$$ConfigNodeResetStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigNodeResetStatusImpl(
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
      json['success'] as bool,
    );

Map<String, dynamic> _$$ConfigNodeResetStatusImplToJson(
        _$ConfigNodeResetStatusImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'success': instance.success,
    };
