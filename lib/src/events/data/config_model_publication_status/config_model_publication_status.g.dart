// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model_publication_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigModelPublicationStatusImpl _$$ConfigModelPublicationStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigModelPublicationStatusImpl(
      (json['elementAddress'] as num).toInt(),
      (json['publishAddress'] as num).toInt(),
      (json['appKeyIndex'] as num).toInt(),
      json['credentialFlag'] as bool,
      (json['publishTtl'] as num).toInt(),
      (json['publicationSteps'] as num).toInt(),
      (json['publicationResolution'] as num).toInt(),
      (json['retransmitCount'] as num).toInt(),
      (json['retransmitIntervalSteps'] as num).toInt(),
      (json['modelIdentifier'] as num).toInt(),
      json['isSuccessful'] as bool,
    );

Map<String, dynamic> _$$ConfigModelPublicationStatusImplToJson(
        _$ConfigModelPublicationStatusImpl instance) =>
    <String, dynamic>{
      'elementAddress': instance.elementAddress,
      'publishAddress': instance.publishAddress,
      'appKeyIndex': instance.appKeyIndex,
      'credentialFlag': instance.credentialFlag,
      'publishTtl': instance.publishTtl,
      'publicationSteps': instance.publicationSteps,
      'publicationResolution': instance.publicationResolution,
      'retransmitCount': instance.retransmitCount,
      'retransmitIntervalSteps': instance.retransmitIntervalSteps,
      'modelIdentifier': instance.modelIdentifier,
      'isSuccessful': instance.isSuccessful,
    };
