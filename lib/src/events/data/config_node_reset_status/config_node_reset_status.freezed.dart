// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_node_reset_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigNodeResetStatus _$ConfigNodeResetStatusFromJson(
    Map<String, dynamic> json) {
  return _ConfigNodeResetStatus.fromJson(json);
}

/// @nodoc
mixin _$ConfigNodeResetStatus {
  int get source => throw _privateConstructorUsedError;
  int get destination => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this ConfigNodeResetStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigNodeResetStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigNodeResetStatusCopyWith<ConfigNodeResetStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigNodeResetStatusCopyWith<$Res> {
  factory $ConfigNodeResetStatusCopyWith(ConfigNodeResetStatus value,
          $Res Function(ConfigNodeResetStatus) then) =
      _$ConfigNodeResetStatusCopyWithImpl<$Res, ConfigNodeResetStatus>;
  @useResult
  $Res call({int source, int destination, bool success});
}

/// @nodoc
class _$ConfigNodeResetStatusCopyWithImpl<$Res,
        $Val extends ConfigNodeResetStatus>
    implements $ConfigNodeResetStatusCopyWith<$Res> {
  _$ConfigNodeResetStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigNodeResetStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? success = null,
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
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigNodeResetStatusImplCopyWith<$Res>
    implements $ConfigNodeResetStatusCopyWith<$Res> {
  factory _$$ConfigNodeResetStatusImplCopyWith(
          _$ConfigNodeResetStatusImpl value,
          $Res Function(_$ConfigNodeResetStatusImpl) then) =
      __$$ConfigNodeResetStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int source, int destination, bool success});
}

/// @nodoc
class __$$ConfigNodeResetStatusImplCopyWithImpl<$Res>
    extends _$ConfigNodeResetStatusCopyWithImpl<$Res,
        _$ConfigNodeResetStatusImpl>
    implements _$$ConfigNodeResetStatusImplCopyWith<$Res> {
  __$$ConfigNodeResetStatusImplCopyWithImpl(_$ConfigNodeResetStatusImpl _value,
      $Res Function(_$ConfigNodeResetStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigNodeResetStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? success = null,
  }) {
    return _then(_$ConfigNodeResetStatusImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigNodeResetStatusImpl implements _ConfigNodeResetStatus {
  const _$ConfigNodeResetStatusImpl(
      this.source, this.destination, this.success);

  factory _$ConfigNodeResetStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigNodeResetStatusImplFromJson(json);

  @override
  final int source;
  @override
  final int destination;
  @override
  final bool success;

  @override
  String toString() {
    return 'ConfigNodeResetStatus(source: $source, destination: $destination, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigNodeResetStatusImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, destination, success);

  /// Create a copy of ConfigNodeResetStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigNodeResetStatusImplCopyWith<_$ConfigNodeResetStatusImpl>
      get copyWith => __$$ConfigNodeResetStatusImplCopyWithImpl<
          _$ConfigNodeResetStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigNodeResetStatusImplToJson(
      this,
    );
  }
}

abstract class _ConfigNodeResetStatus implements ConfigNodeResetStatus {
  const factory _ConfigNodeResetStatus(
          final int source, final int destination, final bool success) =
      _$ConfigNodeResetStatusImpl;

  factory _ConfigNodeResetStatus.fromJson(Map<String, dynamic> json) =
      _$ConfigNodeResetStatusImpl.fromJson;

  @override
  int get source;
  @override
  int get destination;
  @override
  bool get success;

  /// Create a copy of ConfigNodeResetStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigNodeResetStatusImplCopyWith<_$ConfigNodeResetStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
