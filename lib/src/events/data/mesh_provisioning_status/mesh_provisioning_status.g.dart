// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesh_provisioning_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnprovisionedMeshNodeDataImpl _$$UnprovisionedMeshNodeDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UnprovisionedMeshNodeDataImpl(
      json['uuid'] as String,
      provisionerPublicKeyXY: (json['provisionerPublicKeyXY'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UnprovisionedMeshNodeDataImplToJson(
        _$UnprovisionedMeshNodeDataImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'provisionerPublicKeyXY': instance.provisionerPublicKeyXY,
    };

_$ProvisionedMeshNodeDataImpl _$$ProvisionedMeshNodeDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProvisionedMeshNodeDataImpl(
      json['uuid'] as String,
    );

Map<String, dynamic> _$$ProvisionedMeshNodeDataImplToJson(
        _$ProvisionedMeshNodeDataImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
    };

_$MeshProvisioningStatusDataImpl _$$MeshProvisioningStatusDataImplFromJson(
        Map json) =>
    _$MeshProvisioningStatusDataImpl(
      json['state'] as String,
      (json['data'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      json['meshNode'] == null
          ? null
          : UnprovisionedMeshNodeData.fromJson(json['meshNode'] as Map),
    );

Map<String, dynamic> _$$MeshProvisioningStatusDataImplToJson(
        _$MeshProvisioningStatusDataImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'data': instance.data,
      'meshNode': instance.meshNode?.toJson(),
    };

_$MeshProvisioningCompletedDataImpl
    _$$MeshProvisioningCompletedDataImplFromJson(Map json) =>
        _$MeshProvisioningCompletedDataImpl(
          json['state'] as String,
          (json['data'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
          json['meshNode'] == null
              ? null
              : ProvisionedMeshNodeData.fromJson(json['meshNode'] as Map),
        );

Map<String, dynamic> _$$MeshProvisioningCompletedDataImplToJson(
        _$MeshProvisioningCompletedDataImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'data': instance.data,
      'meshNode': instance.meshNode?.toJson(),
    };
