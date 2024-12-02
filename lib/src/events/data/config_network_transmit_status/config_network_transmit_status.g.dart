// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_network_transmit_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigNetworkTransmitStatusImpl _$$ConfigNetworkTransmitStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigNetworkTransmitStatusImpl(
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
      (json['transmitCount'] as num).toInt(),
      (json['transmitIntervalSteps'] as num).toInt(),
    );

Map<String, dynamic> _$$ConfigNetworkTransmitStatusImplToJson(
        _$ConfigNetworkTransmitStatusImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'transmitCount': instance.transmitCount,
      'transmitIntervalSteps': instance.transmitIntervalSteps,
    };
