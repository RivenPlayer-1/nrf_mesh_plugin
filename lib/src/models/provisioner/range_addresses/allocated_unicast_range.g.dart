// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allocated_unicast_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllocatedUnicastRangeImpl _$$AllocatedUnicastRangeImplFromJson(
        Map<String, dynamic> json) =>
    _$AllocatedUnicastRangeImpl(
      (json['lowAddress'] as num).toInt(),
      (json['highAddress'] as num).toInt(),
    );

Map<String, dynamic> _$$AllocatedUnicastRangeImplToJson(
        _$AllocatedUnicastRangeImpl instance) =>
    <String, dynamic>{
      'lowAddress': instance.lowAddress,
      'highAddress': instance.highAddress,
    };
