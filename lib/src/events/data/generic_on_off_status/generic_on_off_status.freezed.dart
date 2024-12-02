// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_on_off_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenericOnOffStatusData _$GenericOnOffStatusDataFromJson(
    Map<String, dynamic> json) {
  return _GenericOnOffStatusData.fromJson(json);
}

/// @nodoc
mixin _$GenericOnOffStatusData {
  int get source => throw _privateConstructorUsedError;
  bool get presentState => throw _privateConstructorUsedError;
  bool? get targetState => throw _privateConstructorUsedError;
  int get transitionResolution => throw _privateConstructorUsedError;
  int get transitionSteps => throw _privateConstructorUsedError;

  /// Serializes this GenericOnOffStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenericOnOffStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenericOnOffStatusDataCopyWith<GenericOnOffStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericOnOffStatusDataCopyWith<$Res> {
  factory $GenericOnOffStatusDataCopyWith(GenericOnOffStatusData value,
          $Res Function(GenericOnOffStatusData) then) =
      _$GenericOnOffStatusDataCopyWithImpl<$Res, GenericOnOffStatusData>;
  @useResult
  $Res call(
      {int source,
      bool presentState,
      bool? targetState,
      int transitionResolution,
      int transitionSteps});
}

/// @nodoc
class _$GenericOnOffStatusDataCopyWithImpl<$Res,
        $Val extends GenericOnOffStatusData>
    implements $GenericOnOffStatusDataCopyWith<$Res> {
  _$GenericOnOffStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenericOnOffStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? presentState = null,
    Object? targetState = freezed,
    Object? transitionResolution = null,
    Object? transitionSteps = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      presentState: null == presentState
          ? _value.presentState
          : presentState // ignore: cast_nullable_to_non_nullable
              as bool,
      targetState: freezed == targetState
          ? _value.targetState
          : targetState // ignore: cast_nullable_to_non_nullable
              as bool?,
      transitionResolution: null == transitionResolution
          ? _value.transitionResolution
          : transitionResolution // ignore: cast_nullable_to_non_nullable
              as int,
      transitionSteps: null == transitionSteps
          ? _value.transitionSteps
          : transitionSteps // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericOnOffStatusDataImplCopyWith<$Res>
    implements $GenericOnOffStatusDataCopyWith<$Res> {
  factory _$$GenericOnOffStatusDataImplCopyWith(
          _$GenericOnOffStatusDataImpl value,
          $Res Function(_$GenericOnOffStatusDataImpl) then) =
      __$$GenericOnOffStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int source,
      bool presentState,
      bool? targetState,
      int transitionResolution,
      int transitionSteps});
}

/// @nodoc
class __$$GenericOnOffStatusDataImplCopyWithImpl<$Res>
    extends _$GenericOnOffStatusDataCopyWithImpl<$Res,
        _$GenericOnOffStatusDataImpl>
    implements _$$GenericOnOffStatusDataImplCopyWith<$Res> {
  __$$GenericOnOffStatusDataImplCopyWithImpl(
      _$GenericOnOffStatusDataImpl _value,
      $Res Function(_$GenericOnOffStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenericOnOffStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? presentState = null,
    Object? targetState = freezed,
    Object? transitionResolution = null,
    Object? transitionSteps = null,
  }) {
    return _then(_$GenericOnOffStatusDataImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == presentState
          ? _value.presentState
          : presentState // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == targetState
          ? _value.targetState
          : targetState // ignore: cast_nullable_to_non_nullable
              as bool?,
      null == transitionResolution
          ? _value.transitionResolution
          : transitionResolution // ignore: cast_nullable_to_non_nullable
              as int,
      null == transitionSteps
          ? _value.transitionSteps
          : transitionSteps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericOnOffStatusDataImpl implements _GenericOnOffStatusData {
  const _$GenericOnOffStatusDataImpl(this.source, this.presentState,
      this.targetState, this.transitionResolution, this.transitionSteps);

  factory _$GenericOnOffStatusDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericOnOffStatusDataImplFromJson(json);

  @override
  final int source;
  @override
  final bool presentState;
  @override
  final bool? targetState;
  @override
  final int transitionResolution;
  @override
  final int transitionSteps;

  @override
  String toString() {
    return 'GenericOnOffStatusData(source: $source, presentState: $presentState, targetState: $targetState, transitionResolution: $transitionResolution, transitionSteps: $transitionSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericOnOffStatusDataImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.presentState, presentState) ||
                other.presentState == presentState) &&
            (identical(other.targetState, targetState) ||
                other.targetState == targetState) &&
            (identical(other.transitionResolution, transitionResolution) ||
                other.transitionResolution == transitionResolution) &&
            (identical(other.transitionSteps, transitionSteps) ||
                other.transitionSteps == transitionSteps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, presentState,
      targetState, transitionResolution, transitionSteps);

  /// Create a copy of GenericOnOffStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericOnOffStatusDataImplCopyWith<_$GenericOnOffStatusDataImpl>
      get copyWith => __$$GenericOnOffStatusDataImplCopyWithImpl<
          _$GenericOnOffStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericOnOffStatusDataImplToJson(
      this,
    );
  }
}

abstract class _GenericOnOffStatusData implements GenericOnOffStatusData {
  const factory _GenericOnOffStatusData(
      final int source,
      final bool presentState,
      final bool? targetState,
      final int transitionResolution,
      final int transitionSteps) = _$GenericOnOffStatusDataImpl;

  factory _GenericOnOffStatusData.fromJson(Map<String, dynamic> json) =
      _$GenericOnOffStatusDataImpl.fromJson;

  @override
  int get source;
  @override
  bool get presentState;
  @override
  bool? get targetState;
  @override
  int get transitionResolution;
  @override
  int get transitionSteps;

  /// Create a copy of GenericOnOffStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenericOnOffStatusDataImplCopyWith<_$GenericOnOffStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
