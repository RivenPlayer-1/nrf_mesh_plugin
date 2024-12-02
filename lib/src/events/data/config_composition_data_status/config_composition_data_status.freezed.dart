// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_composition_data_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigCompositionDataStatusData _$ConfigCompositionDataStatusDataFromJson(
    Map<String, dynamic> json) {
  return _ConfigCompositionDataStatusData.fromJson(json);
}

/// @nodoc
mixin _$ConfigCompositionDataStatusData {
  int get source => throw _privateConstructorUsedError;
  ConfigCompositionDataStatusMeshMessage get meshMessage =>
      throw _privateConstructorUsedError;

  /// Serializes this ConfigCompositionDataStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigCompositionDataStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigCompositionDataStatusDataCopyWith<ConfigCompositionDataStatusData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCompositionDataStatusDataCopyWith<$Res> {
  factory $ConfigCompositionDataStatusDataCopyWith(
          ConfigCompositionDataStatusData value,
          $Res Function(ConfigCompositionDataStatusData) then) =
      _$ConfigCompositionDataStatusDataCopyWithImpl<$Res,
          ConfigCompositionDataStatusData>;
  @useResult
  $Res call({int source, ConfigCompositionDataStatusMeshMessage meshMessage});

  $ConfigCompositionDataStatusMeshMessageCopyWith<$Res> get meshMessage;
}

/// @nodoc
class _$ConfigCompositionDataStatusDataCopyWithImpl<$Res,
        $Val extends ConfigCompositionDataStatusData>
    implements $ConfigCompositionDataStatusDataCopyWith<$Res> {
  _$ConfigCompositionDataStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigCompositionDataStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? meshMessage = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      meshMessage: null == meshMessage
          ? _value.meshMessage
          : meshMessage // ignore: cast_nullable_to_non_nullable
              as ConfigCompositionDataStatusMeshMessage,
    ) as $Val);
  }

  /// Create a copy of ConfigCompositionDataStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCompositionDataStatusMeshMessageCopyWith<$Res> get meshMessage {
    return $ConfigCompositionDataStatusMeshMessageCopyWith<$Res>(
        _value.meshMessage, (value) {
      return _then(_value.copyWith(meshMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfigCompositionDataStatusDataImplCopyWith<$Res>
    implements $ConfigCompositionDataStatusDataCopyWith<$Res> {
  factory _$$ConfigCompositionDataStatusDataImplCopyWith(
          _$ConfigCompositionDataStatusDataImpl value,
          $Res Function(_$ConfigCompositionDataStatusDataImpl) then) =
      __$$ConfigCompositionDataStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int source, ConfigCompositionDataStatusMeshMessage meshMessage});

  @override
  $ConfigCompositionDataStatusMeshMessageCopyWith<$Res> get meshMessage;
}

/// @nodoc
class __$$ConfigCompositionDataStatusDataImplCopyWithImpl<$Res>
    extends _$ConfigCompositionDataStatusDataCopyWithImpl<$Res,
        _$ConfigCompositionDataStatusDataImpl>
    implements _$$ConfigCompositionDataStatusDataImplCopyWith<$Res> {
  __$$ConfigCompositionDataStatusDataImplCopyWithImpl(
      _$ConfigCompositionDataStatusDataImpl _value,
      $Res Function(_$ConfigCompositionDataStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigCompositionDataStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? meshMessage = null,
  }) {
    return _then(_$ConfigCompositionDataStatusDataImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == meshMessage
          ? _value.meshMessage
          : meshMessage // ignore: cast_nullable_to_non_nullable
              as ConfigCompositionDataStatusMeshMessage,
    ));
  }
}

/// @nodoc

@JsonSerializable(anyMap: true)
class _$ConfigCompositionDataStatusDataImpl
    implements _ConfigCompositionDataStatusData {
  const _$ConfigCompositionDataStatusDataImpl(this.source, this.meshMessage);

  factory _$ConfigCompositionDataStatusDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfigCompositionDataStatusDataImplFromJson(json);

  @override
  final int source;
  @override
  final ConfigCompositionDataStatusMeshMessage meshMessage;

  @override
  String toString() {
    return 'ConfigCompositionDataStatusData(source: $source, meshMessage: $meshMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigCompositionDataStatusDataImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.meshMessage, meshMessage) ||
                other.meshMessage == meshMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, meshMessage);

  /// Create a copy of ConfigCompositionDataStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigCompositionDataStatusDataImplCopyWith<
          _$ConfigCompositionDataStatusDataImpl>
      get copyWith => __$$ConfigCompositionDataStatusDataImplCopyWithImpl<
          _$ConfigCompositionDataStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigCompositionDataStatusDataImplToJson(
      this,
    );
  }
}

abstract class _ConfigCompositionDataStatusData
    implements ConfigCompositionDataStatusData {
  const factory _ConfigCompositionDataStatusData(final int source,
          final ConfigCompositionDataStatusMeshMessage meshMessage) =
      _$ConfigCompositionDataStatusDataImpl;

  factory _ConfigCompositionDataStatusData.fromJson(Map<String, dynamic> json) =
      _$ConfigCompositionDataStatusDataImpl.fromJson;

  @override
  int get source;
  @override
  ConfigCompositionDataStatusMeshMessage get meshMessage;

  /// Create a copy of ConfigCompositionDataStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigCompositionDataStatusDataImplCopyWith<
          _$ConfigCompositionDataStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ConfigCompositionDataStatusMeshMessage
    _$ConfigCompositionDataStatusMeshMessageFromJson(
        Map<String, dynamic> json) {
  return _ConfigCompositionDataStatusMeshMessage.fromJson(json);
}

/// @nodoc
mixin _$ConfigCompositionDataStatusMeshMessage {
  int get source => throw _privateConstructorUsedError;
  int? get aszmic => throw _privateConstructorUsedError;
  int get destination => throw _privateConstructorUsedError;

  /// Serializes this ConfigCompositionDataStatusMeshMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigCompositionDataStatusMeshMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigCompositionDataStatusMeshMessageCopyWith<
          ConfigCompositionDataStatusMeshMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCompositionDataStatusMeshMessageCopyWith<$Res> {
  factory $ConfigCompositionDataStatusMeshMessageCopyWith(
          ConfigCompositionDataStatusMeshMessage value,
          $Res Function(ConfigCompositionDataStatusMeshMessage) then) =
      _$ConfigCompositionDataStatusMeshMessageCopyWithImpl<$Res,
          ConfigCompositionDataStatusMeshMessage>;
  @useResult
  $Res call({int source, int? aszmic, int destination});
}

/// @nodoc
class _$ConfigCompositionDataStatusMeshMessageCopyWithImpl<$Res,
        $Val extends ConfigCompositionDataStatusMeshMessage>
    implements $ConfigCompositionDataStatusMeshMessageCopyWith<$Res> {
  _$ConfigCompositionDataStatusMeshMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigCompositionDataStatusMeshMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? aszmic = freezed,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      aszmic: freezed == aszmic
          ? _value.aszmic
          : aszmic // ignore: cast_nullable_to_non_nullable
              as int?,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigCompositionDataStatusMeshMessageImplCopyWith<$Res>
    implements $ConfigCompositionDataStatusMeshMessageCopyWith<$Res> {
  factory _$$ConfigCompositionDataStatusMeshMessageImplCopyWith(
          _$ConfigCompositionDataStatusMeshMessageImpl value,
          $Res Function(_$ConfigCompositionDataStatusMeshMessageImpl) then) =
      __$$ConfigCompositionDataStatusMeshMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int source, int? aszmic, int destination});
}

/// @nodoc
class __$$ConfigCompositionDataStatusMeshMessageImplCopyWithImpl<$Res>
    extends _$ConfigCompositionDataStatusMeshMessageCopyWithImpl<$Res,
        _$ConfigCompositionDataStatusMeshMessageImpl>
    implements _$$ConfigCompositionDataStatusMeshMessageImplCopyWith<$Res> {
  __$$ConfigCompositionDataStatusMeshMessageImplCopyWithImpl(
      _$ConfigCompositionDataStatusMeshMessageImpl _value,
      $Res Function(_$ConfigCompositionDataStatusMeshMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigCompositionDataStatusMeshMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? aszmic = freezed,
    Object? destination = null,
  }) {
    return _then(_$ConfigCompositionDataStatusMeshMessageImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == aszmic
          ? _value.aszmic
          : aszmic // ignore: cast_nullable_to_non_nullable
              as int?,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigCompositionDataStatusMeshMessageImpl
    implements _ConfigCompositionDataStatusMeshMessage {
  const _$ConfigCompositionDataStatusMeshMessageImpl(
      this.source, this.aszmic, this.destination);

  factory _$ConfigCompositionDataStatusMeshMessageImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfigCompositionDataStatusMeshMessageImplFromJson(json);

  @override
  final int source;
  @override
  final int? aszmic;
  @override
  final int destination;

  @override
  String toString() {
    return 'ConfigCompositionDataStatusMeshMessage(source: $source, aszmic: $aszmic, destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigCompositionDataStatusMeshMessageImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.aszmic, aszmic) || other.aszmic == aszmic) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, aszmic, destination);

  /// Create a copy of ConfigCompositionDataStatusMeshMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigCompositionDataStatusMeshMessageImplCopyWith<
          _$ConfigCompositionDataStatusMeshMessageImpl>
      get copyWith =>
          __$$ConfigCompositionDataStatusMeshMessageImplCopyWithImpl<
              _$ConfigCompositionDataStatusMeshMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigCompositionDataStatusMeshMessageImplToJson(
      this,
    );
  }
}

abstract class _ConfigCompositionDataStatusMeshMessage
    implements ConfigCompositionDataStatusMeshMessage {
  const factory _ConfigCompositionDataStatusMeshMessage(
          final int source, final int? aszmic, final int destination) =
      _$ConfigCompositionDataStatusMeshMessageImpl;

  factory _ConfigCompositionDataStatusMeshMessage.fromJson(
          Map<String, dynamic> json) =
      _$ConfigCompositionDataStatusMeshMessageImpl.fromJson;

  @override
  int get source;
  @override
  int? get aszmic;
  @override
  int get destination;

  /// Create a copy of ConfigCompositionDataStatusMeshMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigCompositionDataStatusMeshMessageImplCopyWith<
          _$ConfigCompositionDataStatusMeshMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}
