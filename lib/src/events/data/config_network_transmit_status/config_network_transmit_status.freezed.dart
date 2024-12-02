// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_network_transmit_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigNetworkTransmitStatus _$ConfigNetworkTransmitStatusFromJson(
    Map<String, dynamic> json) {
  return _ConfigNetworkTransmitStatus.fromJson(json);
}

/// @nodoc
mixin _$ConfigNetworkTransmitStatus {
  int get source => throw _privateConstructorUsedError;
  int get destination => throw _privateConstructorUsedError;
  int get transmitCount => throw _privateConstructorUsedError;
  int get transmitIntervalSteps => throw _privateConstructorUsedError;

  /// Serializes this ConfigNetworkTransmitStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigNetworkTransmitStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigNetworkTransmitStatusCopyWith<ConfigNetworkTransmitStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigNetworkTransmitStatusCopyWith<$Res> {
  factory $ConfigNetworkTransmitStatusCopyWith(
          ConfigNetworkTransmitStatus value,
          $Res Function(ConfigNetworkTransmitStatus) then) =
      _$ConfigNetworkTransmitStatusCopyWithImpl<$Res,
          ConfigNetworkTransmitStatus>;
  @useResult
  $Res call(
      {int source,
      int destination,
      int transmitCount,
      int transmitIntervalSteps});
}

/// @nodoc
class _$ConfigNetworkTransmitStatusCopyWithImpl<$Res,
        $Val extends ConfigNetworkTransmitStatus>
    implements $ConfigNetworkTransmitStatusCopyWith<$Res> {
  _$ConfigNetworkTransmitStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigNetworkTransmitStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? transmitCount = null,
    Object? transmitIntervalSteps = null,
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
      transmitCount: null == transmitCount
          ? _value.transmitCount
          : transmitCount // ignore: cast_nullable_to_non_nullable
              as int,
      transmitIntervalSteps: null == transmitIntervalSteps
          ? _value.transmitIntervalSteps
          : transmitIntervalSteps // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigNetworkTransmitStatusImplCopyWith<$Res>
    implements $ConfigNetworkTransmitStatusCopyWith<$Res> {
  factory _$$ConfigNetworkTransmitStatusImplCopyWith(
          _$ConfigNetworkTransmitStatusImpl value,
          $Res Function(_$ConfigNetworkTransmitStatusImpl) then) =
      __$$ConfigNetworkTransmitStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int source,
      int destination,
      int transmitCount,
      int transmitIntervalSteps});
}

/// @nodoc
class __$$ConfigNetworkTransmitStatusImplCopyWithImpl<$Res>
    extends _$ConfigNetworkTransmitStatusCopyWithImpl<$Res,
        _$ConfigNetworkTransmitStatusImpl>
    implements _$$ConfigNetworkTransmitStatusImplCopyWith<$Res> {
  __$$ConfigNetworkTransmitStatusImplCopyWithImpl(
      _$ConfigNetworkTransmitStatusImpl _value,
      $Res Function(_$ConfigNetworkTransmitStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigNetworkTransmitStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? transmitCount = null,
    Object? transmitIntervalSteps = null,
  }) {
    return _then(_$ConfigNetworkTransmitStatusImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
      null == transmitCount
          ? _value.transmitCount
          : transmitCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == transmitIntervalSteps
          ? _value.transmitIntervalSteps
          : transmitIntervalSteps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigNetworkTransmitStatusImpl
    implements _ConfigNetworkTransmitStatus {
  const _$ConfigNetworkTransmitStatusImpl(this.source, this.destination,
      this.transmitCount, this.transmitIntervalSteps);

  factory _$ConfigNetworkTransmitStatusImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfigNetworkTransmitStatusImplFromJson(json);

  @override
  final int source;
  @override
  final int destination;
  @override
  final int transmitCount;
  @override
  final int transmitIntervalSteps;

  @override
  String toString() {
    return 'ConfigNetworkTransmitStatus(source: $source, destination: $destination, transmitCount: $transmitCount, transmitIntervalSteps: $transmitIntervalSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigNetworkTransmitStatusImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.transmitCount, transmitCount) ||
                other.transmitCount == transmitCount) &&
            (identical(other.transmitIntervalSteps, transmitIntervalSteps) ||
                other.transmitIntervalSteps == transmitIntervalSteps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, source, destination, transmitCount, transmitIntervalSteps);

  /// Create a copy of ConfigNetworkTransmitStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigNetworkTransmitStatusImplCopyWith<_$ConfigNetworkTransmitStatusImpl>
      get copyWith => __$$ConfigNetworkTransmitStatusImplCopyWithImpl<
          _$ConfigNetworkTransmitStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigNetworkTransmitStatusImplToJson(
      this,
    );
  }
}

abstract class _ConfigNetworkTransmitStatus
    implements ConfigNetworkTransmitStatus {
  const factory _ConfigNetworkTransmitStatus(
      final int source,
      final int destination,
      final int transmitCount,
      final int transmitIntervalSteps) = _$ConfigNetworkTransmitStatusImpl;

  factory _ConfigNetworkTransmitStatus.fromJson(Map<String, dynamic> json) =
      _$ConfigNetworkTransmitStatusImpl.fromJson;

  @override
  int get source;
  @override
  int get destination;
  @override
  int get transmitCount;
  @override
  int get transmitIntervalSteps;

  /// Create a copy of ConfigNetworkTransmitStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigNetworkTransmitStatusImplCopyWith<_$ConfigNetworkTransmitStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
