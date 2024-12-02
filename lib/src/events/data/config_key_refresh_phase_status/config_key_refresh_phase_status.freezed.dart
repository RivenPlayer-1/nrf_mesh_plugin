// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_key_refresh_phase_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigKeyRefreshPhaseStatus _$ConfigKeyRefreshPhaseStatusFromJson(
    Map<String, dynamic> json) {
  return _ConfigKeyRefreshPhaseStatus.fromJson(json);
}

/// @nodoc
mixin _$ConfigKeyRefreshPhaseStatus {
  int get source => throw _privateConstructorUsedError;
  int get destination => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get statusCodeName => throw _privateConstructorUsedError;
  int get netKeyIndex => throw _privateConstructorUsedError;
  int get transition => throw _privateConstructorUsedError;

  /// Serializes this ConfigKeyRefreshPhaseStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigKeyRefreshPhaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigKeyRefreshPhaseStatusCopyWith<ConfigKeyRefreshPhaseStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigKeyRefreshPhaseStatusCopyWith<$Res> {
  factory $ConfigKeyRefreshPhaseStatusCopyWith(
          ConfigKeyRefreshPhaseStatus value,
          $Res Function(ConfigKeyRefreshPhaseStatus) then) =
      _$ConfigKeyRefreshPhaseStatusCopyWithImpl<$Res,
          ConfigKeyRefreshPhaseStatus>;
  @useResult
  $Res call(
      {int source,
      int destination,
      int statusCode,
      String statusCodeName,
      int netKeyIndex,
      int transition});
}

/// @nodoc
class _$ConfigKeyRefreshPhaseStatusCopyWithImpl<$Res,
        $Val extends ConfigKeyRefreshPhaseStatus>
    implements $ConfigKeyRefreshPhaseStatusCopyWith<$Res> {
  _$ConfigKeyRefreshPhaseStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigKeyRefreshPhaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? statusCode = null,
    Object? statusCodeName = null,
    Object? netKeyIndex = null,
    Object? transition = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      statusCodeName: null == statusCodeName
          ? _value.statusCodeName
          : statusCodeName // ignore: cast_nullable_to_non_nullable
              as String,
      netKeyIndex: null == netKeyIndex
          ? _value.netKeyIndex
          : netKeyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      transition: null == transition
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigKeyRefreshPhaseStatusImplCopyWith<$Res>
    implements $ConfigKeyRefreshPhaseStatusCopyWith<$Res> {
  factory _$$ConfigKeyRefreshPhaseStatusImplCopyWith(
          _$ConfigKeyRefreshPhaseStatusImpl value,
          $Res Function(_$ConfigKeyRefreshPhaseStatusImpl) then) =
      __$$ConfigKeyRefreshPhaseStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int source,
      int destination,
      int statusCode,
      String statusCodeName,
      int netKeyIndex,
      int transition});
}

/// @nodoc
class __$$ConfigKeyRefreshPhaseStatusImplCopyWithImpl<$Res>
    extends _$ConfigKeyRefreshPhaseStatusCopyWithImpl<$Res,
        _$ConfigKeyRefreshPhaseStatusImpl>
    implements _$$ConfigKeyRefreshPhaseStatusImplCopyWith<$Res> {
  __$$ConfigKeyRefreshPhaseStatusImplCopyWithImpl(
      _$ConfigKeyRefreshPhaseStatusImpl _value,
      $Res Function(_$ConfigKeyRefreshPhaseStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigKeyRefreshPhaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? statusCode = null,
    Object? statusCodeName = null,
    Object? netKeyIndex = null,
    Object? transition = null,
  }) {
    return _then(_$ConfigKeyRefreshPhaseStatusImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      null == statusCodeName
          ? _value.statusCodeName
          : statusCodeName // ignore: cast_nullable_to_non_nullable
              as String,
      null == netKeyIndex
          ? _value.netKeyIndex
          : netKeyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == transition
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigKeyRefreshPhaseStatusImpl
    implements _ConfigKeyRefreshPhaseStatus {
  const _$ConfigKeyRefreshPhaseStatusImpl(this.source, this.destination,
      this.statusCode, this.statusCodeName, this.netKeyIndex, this.transition);

  factory _$ConfigKeyRefreshPhaseStatusImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfigKeyRefreshPhaseStatusImplFromJson(json);

  @override
  final int source;
  @override
  final int destination;
  @override
  final int statusCode;
  @override
  final String statusCodeName;
  @override
  final int netKeyIndex;
  @override
  final int transition;

  @override
  String toString() {
    return 'ConfigKeyRefreshPhaseStatus(source: $source, destination: $destination, statusCode: $statusCode, statusCodeName: $statusCodeName, netKeyIndex: $netKeyIndex, transition: $transition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigKeyRefreshPhaseStatusImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusCodeName, statusCodeName) ||
                other.statusCodeName == statusCodeName) &&
            (identical(other.netKeyIndex, netKeyIndex) ||
                other.netKeyIndex == netKeyIndex) &&
            (identical(other.transition, transition) ||
                other.transition == transition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, destination, statusCode,
      statusCodeName, netKeyIndex, transition);

  /// Create a copy of ConfigKeyRefreshPhaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigKeyRefreshPhaseStatusImplCopyWith<_$ConfigKeyRefreshPhaseStatusImpl>
      get copyWith => __$$ConfigKeyRefreshPhaseStatusImplCopyWithImpl<
          _$ConfigKeyRefreshPhaseStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigKeyRefreshPhaseStatusImplToJson(
      this,
    );
  }
}

abstract class _ConfigKeyRefreshPhaseStatus
    implements ConfigKeyRefreshPhaseStatus {
  const factory _ConfigKeyRefreshPhaseStatus(
      final int source,
      final int destination,
      final int statusCode,
      final String statusCodeName,
      final int netKeyIndex,
      final int transition) = _$ConfigKeyRefreshPhaseStatusImpl;

  factory _ConfigKeyRefreshPhaseStatus.fromJson(Map<String, dynamic> json) =
      _$ConfigKeyRefreshPhaseStatusImpl.fromJson;

  @override
  int get source;
  @override
  int get destination;
  @override
  int get statusCode;
  @override
  String get statusCodeName;
  @override
  int get netKeyIndex;
  @override
  int get transition;

  /// Create a copy of ConfigKeyRefreshPhaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigKeyRefreshPhaseStatusImplCopyWith<_$ConfigKeyRefreshPhaseStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
