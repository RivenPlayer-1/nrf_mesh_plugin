// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_beacon_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigBeaconStatusImpl _$$ConfigBeaconStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigBeaconStatusImpl(
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
      json['enable'] as bool,
    );

Map<String, dynamic> _$$ConfigBeaconStatusImplToJson(
        _$ConfigBeaconStatusImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'enable': instance.enable,
    };
