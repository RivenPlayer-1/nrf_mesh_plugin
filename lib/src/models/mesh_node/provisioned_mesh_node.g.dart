// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioned_mesh_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelData _$ModelDataFromJson(Map json) => ModelData(
      (json['key'] as num).toInt(),
      (json['modelId'] as num).toInt(),
      (json['subscribedAddresses'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      (json['boundAppKey'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      json['modelName'] as String,
    );

Map<String, dynamic> _$ModelDataToJson(ModelData instance) => <String, dynamic>{
      'key': instance.key,
      'modelId': instance.modelId,
      'subscribedAddresses': instance.subscribedAddresses,
      'boundAppKey': instance.boundAppKey,
      'modelName': instance.modelName,
    };

ElementData _$ElementDataFromJson(Map json) => ElementData(
      (json['key'] as num).toInt(),
      json['name'] as String,
      (json['address'] as num).toInt(),
      (json['locationDescriptor'] as num).toInt(),
      (json['models'] as List<dynamic>)
          .map((e) => ModelData.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$ElementDataToJson(ElementData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'address': instance.address,
      'name': instance.name,
      'locationDescriptor': instance.locationDescriptor,
      'models': instance.models,
    };
