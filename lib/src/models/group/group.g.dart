// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupDataImpl _$$GroupDataImplFromJson(Map<String, dynamic> json) =>
    _$GroupDataImpl(
      json['name'] as String,
      (json['address'] as num).toInt(),
      json['addressLabel'] as String?,
      json['meshUuid'] as String,
      (json['parentAddress'] as num).toInt(),
      json['parentAddressLabel'] as String?,
    );

Map<String, dynamic> _$$GroupDataImplToJson(_$GroupDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'addressLabel': instance.addressLabel,
      'meshUuid': instance.meshUuid,
      'parentAddress': instance.parentAddress,
      'parentAddressLabel': instance.parentAddressLabel,
    };
