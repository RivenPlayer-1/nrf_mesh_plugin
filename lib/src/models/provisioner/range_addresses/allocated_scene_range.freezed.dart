// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allocated_scene_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllocatedSceneRange _$AllocatedSceneRangeFromJson(Map<String, dynamic> json) {
  return _AllocatedSceneRange.fromJson(json);
}

/// @nodoc
mixin _$AllocatedSceneRange {
  int get firstScene => throw _privateConstructorUsedError;
  int get lastScene => throw _privateConstructorUsedError;

  /// Serializes this AllocatedSceneRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllocatedSceneRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllocatedSceneRangeCopyWith<AllocatedSceneRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllocatedSceneRangeCopyWith<$Res> {
  factory $AllocatedSceneRangeCopyWith(
          AllocatedSceneRange value, $Res Function(AllocatedSceneRange) then) =
      _$AllocatedSceneRangeCopyWithImpl<$Res, AllocatedSceneRange>;
  @useResult
  $Res call({int firstScene, int lastScene});
}

/// @nodoc
class _$AllocatedSceneRangeCopyWithImpl<$Res, $Val extends AllocatedSceneRange>
    implements $AllocatedSceneRangeCopyWith<$Res> {
  _$AllocatedSceneRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllocatedSceneRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstScene = null,
    Object? lastScene = null,
  }) {
    return _then(_value.copyWith(
      firstScene: null == firstScene
          ? _value.firstScene
          : firstScene // ignore: cast_nullable_to_non_nullable
              as int,
      lastScene: null == lastScene
          ? _value.lastScene
          : lastScene // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllocatedSceneRangeImplCopyWith<$Res>
    implements $AllocatedSceneRangeCopyWith<$Res> {
  factory _$$AllocatedSceneRangeImplCopyWith(_$AllocatedSceneRangeImpl value,
          $Res Function(_$AllocatedSceneRangeImpl) then) =
      __$$AllocatedSceneRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int firstScene, int lastScene});
}

/// @nodoc
class __$$AllocatedSceneRangeImplCopyWithImpl<$Res>
    extends _$AllocatedSceneRangeCopyWithImpl<$Res, _$AllocatedSceneRangeImpl>
    implements _$$AllocatedSceneRangeImplCopyWith<$Res> {
  __$$AllocatedSceneRangeImplCopyWithImpl(_$AllocatedSceneRangeImpl _value,
      $Res Function(_$AllocatedSceneRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllocatedSceneRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstScene = null,
    Object? lastScene = null,
  }) {
    return _then(_$AllocatedSceneRangeImpl(
      null == firstScene
          ? _value.firstScene
          : firstScene // ignore: cast_nullable_to_non_nullable
              as int,
      null == lastScene
          ? _value.lastScene
          : lastScene // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllocatedSceneRangeImpl implements _AllocatedSceneRange {
  const _$AllocatedSceneRangeImpl(this.firstScene, this.lastScene);

  factory _$AllocatedSceneRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllocatedSceneRangeImplFromJson(json);

  @override
  final int firstScene;
  @override
  final int lastScene;

  @override
  String toString() {
    return 'AllocatedSceneRange(firstScene: $firstScene, lastScene: $lastScene)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllocatedSceneRangeImpl &&
            (identical(other.firstScene, firstScene) ||
                other.firstScene == firstScene) &&
            (identical(other.lastScene, lastScene) ||
                other.lastScene == lastScene));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstScene, lastScene);

  /// Create a copy of AllocatedSceneRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllocatedSceneRangeImplCopyWith<_$AllocatedSceneRangeImpl> get copyWith =>
      __$$AllocatedSceneRangeImplCopyWithImpl<_$AllocatedSceneRangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllocatedSceneRangeImplToJson(
      this,
    );
  }
}

abstract class _AllocatedSceneRange implements AllocatedSceneRange {
  const factory _AllocatedSceneRange(
      final int firstScene, final int lastScene) = _$AllocatedSceneRangeImpl;

  factory _AllocatedSceneRange.fromJson(Map<String, dynamic> json) =
      _$AllocatedSceneRangeImpl.fromJson;

  @override
  int get firstScene;
  @override
  int get lastScene;

  /// Create a copy of AllocatedSceneRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllocatedSceneRangeImplCopyWith<_$AllocatedSceneRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
