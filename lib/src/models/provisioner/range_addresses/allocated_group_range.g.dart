// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allocated_group_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllocatedGroupRangeImpl _$$AllocatedGroupRangeImplFromJson(
        Map<String, dynamic> json) =>
    _$AllocatedGroupRangeImpl(
      (json['lowAddress'] as num).toInt(),
      (json['highAddress'] as num).toInt(),
    );

Map<String, dynamic> _$$AllocatedGroupRangeImplToJson(
        _$AllocatedGroupRangeImpl instance) =>
    <String, dynamic>{
      'lowAddress': instance.lowAddress,
      'highAddress': instance.highAddress,
    };
