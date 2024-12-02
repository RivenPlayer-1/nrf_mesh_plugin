// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_location_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericLocationStatusDataImpl _$$GenericLocationStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericLocationStatusDataImpl(
      (json['source'] as num).toInt(),
      (json['latitude'] as num).toInt(),
      (json['longitude'] as num).toInt(),
      (json['altitude'] as num).toInt(),
    );

Map<String, dynamic> _$$GenericLocationStatusDataImplToJson(
        _$GenericLocationStatusDataImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
    };
