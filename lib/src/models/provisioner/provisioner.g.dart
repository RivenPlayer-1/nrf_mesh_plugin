// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvisionerImpl _$$ProvisionerImplFromJson(Map<String, dynamic> json) =>
    _$ProvisionerImpl(
      json['provisionerName'] as String,
      json['provisionerUuid'] as String,
      (json['globalTtl'] as num).toInt(),
      (json['provisionerAddress'] as num).toInt(),
      (json['allocatedUnicastRanges'] as List<dynamic>)
          .map((e) => AllocatedUnicastRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['allocatedGroupRanges'] as List<dynamic>)
          .map((e) => AllocatedGroupRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['allocatedSceneRanges'] as List<dynamic>)
          .map((e) => AllocatedSceneRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['lastSelected'] as bool,
    );

Map<String, dynamic> _$$ProvisionerImplToJson(_$ProvisionerImpl instance) =>
    <String, dynamic>{
      'provisionerName': instance.provisionerName,
      'provisionerUuid': instance.provisionerUuid,
      'globalTtl': instance.globalTtl,
      'provisionerAddress': instance.provisionerAddress,
      'allocatedUnicastRanges': instance.allocatedUnicastRanges,
      'allocatedGroupRanges': instance.allocatedGroupRanges,
      'allocatedSceneRanges': instance.allocatedSceneRanges,
      'lastSelected': instance.lastSelected,
    };
