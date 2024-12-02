// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkKeyImpl _$$NetworkKeyImplFromJson(Map<String, dynamic> json) =>
    _$NetworkKeyImpl(
      json['name'] as String,
      (json['netKeyIndex'] as num).toInt(),
      (json['phase'] as num).toInt(),
      json['phaseDescription'] as String,
      json['isMinSecurity'] as bool,
      (json['netKeyBytes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      (json['oldNetKeyBytes'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      (json['txNetworkKey'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      (json['identityKey'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      (json['oldIdentityKey'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      json['meshUuid'] as String,
      (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$$NetworkKeyImplToJson(_$NetworkKeyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'netKeyIndex': instance.netKeyIndex,
      'phase': instance.phase,
      'phaseDescription': instance.phaseDescription,
      'isMinSecurity': instance.isMinSecurity,
      'netKeyBytes': instance.netKeyBytes,
      'oldNetKeyBytes': instance.oldNetKeyBytes,
      'txNetworkKey': instance.txNetworkKey,
      'identityKey': instance.identityKey,
      'oldIdentityKey': instance.oldIdentityKey,
      'meshUuid': instance.meshUuid,
      'timestamp': instance.timestamp,
    };
