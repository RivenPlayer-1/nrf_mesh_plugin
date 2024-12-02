// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_provisioning_pdu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendProvisioningPduDataImpl _$$SendProvisioningPduDataImplFromJson(
        Map json) =>
    _$SendProvisioningPduDataImpl(
      (json['pdu'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      UnprovisionedMeshNode.fromJson(json['meshNode'] as Map),
    );

Map<String, dynamic> _$$SendProvisioningPduDataImplToJson(
        _$SendProvisioningPduDataImpl instance) =>
    <String, dynamic>{
      'pdu': instance.pdu,
      'meshNode': instance.meshNode.toJson(),
    };
