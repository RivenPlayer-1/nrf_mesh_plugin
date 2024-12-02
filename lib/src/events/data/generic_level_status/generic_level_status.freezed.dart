// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_level_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenericLevelStatusData _$GenericLevelStatusDataFromJson(
    Map<String, dynamic> json) {
  return _GenericLevelStatusData.fromJson(json);
}

/// @nodoc
mixin _$GenericLevelStatusData {
  int get level => throw _privateConstructorUsedError;
  int? get targetLevel => throw _privateConstructorUsedError;
  int? get transitionSteps => throw _privateConstructorUsedError;
  int? get transitionResolution => throw _privateConstructorUsedError;
  int get source => throw _privateConstructorUsedError;
  int get destination => throw _privateConstructorUsedError;

  /// Serializes this GenericLevelStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenericLevelStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenericLevelStatusDataCopyWith<GenericLevelStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericLevelStatusDataCopyWith<$Res> {
  factory $GenericLevelStatusDataCopyWith(GenericLevelStatusData value,
          $Res Function(GenericLevelStatusData) then) =
      _$GenericLevelStatusDataCopyWithImpl<$Res, GenericLevelStatusData>;
  @useResult
  $Res call(
      {int level,
      int? targetLevel,
      int? transitionSteps,
      int? transitionResolution,
      int source,
      int destination});
}

/// @nodoc
class _$GenericLevelStatusDataCopyWithImpl<$Res,
        $Val extends GenericLevelStatusData>
    implements $GenericLevelStatusDataCopyWith<$Res> {
  _$GenericLevelStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenericLevelStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? targetLevel = freezed,
    Object? transitionSteps = freezed,
    Object? transitionResolution = freezed,
    Object? source = null,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      targetLevel: freezed == targetLevel
          ? _value.targetLevel
          : targetLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      transitionSteps: freezed == transitionSteps
          ? _value.transitionSteps
          : transitionSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      transitionResolution: freezed == transitionResolution
          ? _value.transitionResolution
          : transitionResolution // ignore: cast_nullable_to_non_nullable
              as int?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericLevelStatusDataImplCopyWith<$Res>
    implements $GenericLevelStatusDataCopyWith<$Res> {
  factory _$$GenericLevelStatusDataImplCopyWith(
          _$GenericLevelStatusDataImpl value,
          $Res Function(_$GenericLevelStatusDataImpl) then) =
      __$$GenericLevelStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int level,
      int? targetLevel,
      int? transitionSteps,
      int? transitionResolution,
      int source,
      int destination});
}

/// @nodoc
class __$$GenericLevelStatusDataImplCopyWithImpl<$Res>
    extends _$GenericLevelStatusDataCopyWithImpl<$Res,
        _$GenericLevelStatusDataImpl>
    implements _$$GenericLevelStatusDataImplCopyWith<$Res> {
  __$$GenericLevelStatusDataImplCopyWithImpl(
      _$GenericLevelStatusDataImpl _value,
      $Res Function(_$GenericLevelStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenericLevelStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? targetLevel = freezed,
    Object? transitionSteps = freezed,
    Object? transitionResolution = freezed,
    Object? source = null,
    Object? destination = null,
  }) {
    return _then(_$GenericLevelStatusDataImpl(
      null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == targetLevel
          ? _value.targetLevel
          : targetLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == transitionSteps
          ? _value.transitionSteps
          : transitionSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == transitionResolution
          ? _value.transitionResolution
          : transitionResolution // ignore: cast_nullable_to_non_nullable
              as int?,
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericLevelStatusDataImpl implements _GenericLevelStatusData {
  const _$GenericLevelStatusDataImpl(
      this.level,
      this.targetLevel,
      this.transitionSteps,
      this.transitionResolution,
      this.source,
      this.destination);

  factory _$GenericLevelStatusDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericLevelStatusDataImplFromJson(json);

  @override
  final int level;
  @override
  final int? targetLevel;
  @override
  final int? transitionSteps;
  @override
  final int? transitionResolution;
  @override
  final int source;
  @override
  final int destination;

  @override
  String toString() {
    return 'GenericLevelStatusData(level: $level, targetLevel: $targetLevel, transitionSteps: $transitionSteps, transitionResolution: $transitionResolution, source: $source, destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericLevelStatusDataImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.targetLevel, targetLevel) ||
                other.targetLevel == targetLevel) &&
            (identical(other.transitionSteps, transitionSteps) ||
                other.transitionSteps == transitionSteps) &&
            (identical(other.transitionResolution, transitionResolution) ||
                other.transitionResolution == transitionResolution) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, level, targetLevel,
      transitionSteps, transitionResolution, source, destination);

  /// Create a copy of GenericLevelStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericLevelStatusDataImplCopyWith<_$GenericLevelStatusDataImpl>
      get copyWith => __$$GenericLevelStatusDataImplCopyWithImpl<
          _$GenericLevelStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericLevelStatusDataImplToJson(
      this,
    );
  }
}

abstract class _GenericLevelStatusData implements GenericLevelStatusData {
  const factory _GenericLevelStatusData(
      final int level,
      final int? targetLevel,
      final int? transitionSteps,
      final int? transitionResolution,
      final int source,
      final int destination) = _$GenericLevelStatusDataImpl;

  factory _GenericLevelStatusData.fromJson(Map<String, dynamic> json) =
      _$GenericLevelStatusDataImpl.fromJson;

  @override
  int get level;
  @override
  int? get targetLevel;
  @override
  int? get transitionSteps;
  @override
  int? get transitionResolution;
  @override
  int get source;
  @override
  int get destination;

  /// Create a copy of GenericLevelStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenericLevelStatusDataImplCopyWith<_$GenericLevelStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
