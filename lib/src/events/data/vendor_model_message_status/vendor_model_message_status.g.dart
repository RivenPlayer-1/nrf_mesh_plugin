// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model_message_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorModelMessageStatusDataImpl _$$VendorModelMessageStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$VendorModelMessageStatusDataImpl(
      (json['source'] as num).toInt(),
      (json['modelIdentifier'] as num).toInt(),
      const Uint8ListConverter().fromJson(json['message'] as List),
    );

Map<String, dynamic> _$$VendorModelMessageStatusDataImplToJson(
        _$VendorModelMessageStatusDataImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'modelIdentifier': instance.modelIdentifier,
      'message': const Uint8ListConverter().toJson(instance.message),
    };
