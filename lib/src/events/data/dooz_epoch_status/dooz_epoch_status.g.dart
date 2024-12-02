// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dooz_epoch_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoozEpochStatusDataImpl _$$DoozEpochStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DoozEpochStatusDataImpl(
      (json['tzData'] as num).toInt(),
      (json['command'] as num).toInt(),
      (json['io'] as num).toInt(),
      (json['unused'] as num).toInt(),
      (json['epoch'] as num).toInt(),
      (json['correlation'] as num).toInt(),
      (json['extra'] as num).toInt(),
      (json['source'] as num).toInt(),
      (json['destination'] as num).toInt(),
    );

Map<String, dynamic> _$$DoozEpochStatusDataImplToJson(
        _$DoozEpochStatusDataImpl instance) =>
    <String, dynamic>{
      'tzData': instance.tzData,
      'command': instance.command,
      'io': instance.io,
      'unused': instance.unused,
      'epoch': instance.epoch,
      'correlation': instance.correlation,
      'extra': instance.extra,
      'source': instance.source,
      'destination': instance.destination,
    };
