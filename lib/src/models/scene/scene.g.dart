// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SceneData _$SceneDataFromJson(Map json) => SceneData(
      meshUuid: json['meshUuid'] as String,
      name: json['name'] as String,
      number: (json['number'] as num).toInt(),
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SceneDataToJson(SceneData instance) => <String, dynamic>{
      'meshUuid': instance.meshUuid,
      'name': instance.name,
      'number': instance.number,
      'addresses': instance.addresses,
    };
