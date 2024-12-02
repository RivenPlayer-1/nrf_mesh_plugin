// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_beacon_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigBeaconStatus _$ConfigBeaconStatusFromJson(Map<String, dynamic> json) {
  return _ConfigBeaconStatus.fromJson(json);
}

/// @nodoc
mixin _$ConfigBeaconStatus {
  int get source => throw _privateConstructorUsedError;
  int get destination => throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;

  /// Serializes this ConfigBeaconStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigBeaconStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigBeaconStatusCopyWith<ConfigBeaconStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigBeaconStatusCopyWith<$Res> {
  factory $ConfigBeaconStatusCopyWith(
          ConfigBeaconStatus value, $Res Function(ConfigBeaconStatus) then) =
      _$ConfigBeaconStatusCopyWithImpl<$Res, ConfigBeaconStatus>;
  @useResult
  $Res call({int source, int destination, bool enable});
}

/// @nodoc
class _$ConfigBeaconStatusCopyWithImpl<$Res, $Val extends ConfigBeaconStatus>
    implements $ConfigBeaconStatusCopyWith<$Res> {
  _$ConfigBeaconStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigBeaconStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? enable = null,
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
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigBeaconStatusImplCopyWith<$Res>
    implements $ConfigBeaconStatusCopyWith<$Res> {
  factory _$$ConfigBeaconStatusImplCopyWith(_$ConfigBeaconStatusImpl value,
          $Res Function(_$ConfigBeaconStatusImpl) then) =
      __$$ConfigBeaconStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int source, int destination, bool enable});
}

/// @nodoc
class __$$ConfigBeaconStatusImplCopyWithImpl<$Res>
    extends _$ConfigBeaconStatusCopyWithImpl<$Res, _$ConfigBeaconStatusImpl>
    implements _$$ConfigBeaconStatusImplCopyWith<$Res> {
  __$$ConfigBeaconStatusImplCopyWithImpl(_$ConfigBeaconStatusImpl _value,
      $Res Function(_$ConfigBeaconStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigBeaconStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? enable = null,
  }) {
    return _then(_$ConfigBeaconStatusImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
      null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigBeaconStatusImpl implements _ConfigBeaconStatus {
  const _$ConfigBeaconStatusImpl(this.source, this.destination, this.enable);

  factory _$ConfigBeaconStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigBeaconStatusImplFromJson(json);

  @override
  final int source;
  @override
  final int destination;
  @override
  final bool enable;

  @override
  String toString() {
    return 'ConfigBeaconStatus(source: $source, destination: $destination, enable: $enable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigBeaconStatusImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.enable, enable) || other.enable == enable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, destination, enable);

  /// Create a copy of ConfigBeaconStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigBeaconStatusImplCopyWith<_$ConfigBeaconStatusImpl> get copyWith =>
      __$$ConfigBeaconStatusImplCopyWithImpl<_$ConfigBeaconStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigBeaconStatusImplToJson(
      this,
    );
  }
}

abstract class _ConfigBeaconStatus implements ConfigBeaconStatus {
  const factory _ConfigBeaconStatus(
          final int source, final int destination, final bool enable) =
      _$ConfigBeaconStatusImpl;

  factory _ConfigBeaconStatus.fromJson(Map<String, dynamic> json) =
      _$ConfigBeaconStatusImpl.fromJson;

  @override
  int get source;
  @override
  int get destination;
  @override
  bool get enable;

  /// Create a copy of ConfigBeaconStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigBeaconStatusImplCopyWith<_$ConfigBeaconStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
