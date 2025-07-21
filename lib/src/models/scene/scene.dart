import 'package:freezed_annotation/freezed_annotation.dart';

part 'scene.g.dart';

/// {@template scene_data}
/// A freezed data class used to hold a scene data
/// {@endtemplate}
@JsonSerializable(anyMap: true)
class SceneData {
  /// The generated code assumes these values exist in JSON.
  final String meshUuid, name;
  final int number;
  final List<int> addresses;

  SceneData({required this.meshUuid, required this.name, required this.number, required this.addresses});

  /// Connect the generated [_$SceneDataFromJson] function to the `fromJson`
  /// factory.
  factory SceneData.fromJson(Map<String, dynamic> json) => _$SceneDataFromJson(json);
  /// Connect the generated [_$SceneDataoJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SceneDataToJson(this);
}
