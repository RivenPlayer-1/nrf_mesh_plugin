// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mesh_network_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeshNetworkEventData _$MeshNetworkEventDataFromJson(Map<String, dynamic> json) {
  return _MeshNetworkEventData.fromJson(json);
}

/// @nodoc
mixin _$MeshNetworkEventData {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this MeshNetworkEventData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeshNetworkEventData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeshNetworkEventDataCopyWith<MeshNetworkEventData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeshNetworkEventDataCopyWith<$Res> {
  factory $MeshNetworkEventDataCopyWith(MeshNetworkEventData value,
          $Res Function(MeshNetworkEventData) then) =
      _$MeshNetworkEventDataCopyWithImpl<$Res, MeshNetworkEventData>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MeshNetworkEventDataCopyWithImpl<$Res,
        $Val extends MeshNetworkEventData>
    implements $MeshNetworkEventDataCopyWith<$Res> {
  _$MeshNetworkEventDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeshNetworkEventData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeshNetworkEventDataImplCopyWith<$Res>
    implements $MeshNetworkEventDataCopyWith<$Res> {
  factory _$$MeshNetworkEventDataImplCopyWith(_$MeshNetworkEventDataImpl value,
          $Res Function(_$MeshNetworkEventDataImpl) then) =
      __$$MeshNetworkEventDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MeshNetworkEventDataImplCopyWithImpl<$Res>
    extends _$MeshNetworkEventDataCopyWithImpl<$Res, _$MeshNetworkEventDataImpl>
    implements _$$MeshNetworkEventDataImplCopyWith<$Res> {
  __$$MeshNetworkEventDataImplCopyWithImpl(_$MeshNetworkEventDataImpl _value,
      $Res Function(_$MeshNetworkEventDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeshNetworkEventData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MeshNetworkEventDataImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeshNetworkEventDataImpl implements _MeshNetworkEventData {
  const _$MeshNetworkEventDataImpl(this.id);

  factory _$MeshNetworkEventDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeshNetworkEventDataImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MeshNetworkEventData(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshNetworkEventDataImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MeshNetworkEventData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshNetworkEventDataImplCopyWith<_$MeshNetworkEventDataImpl>
      get copyWith =>
          __$$MeshNetworkEventDataImplCopyWithImpl<_$MeshNetworkEventDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeshNetworkEventDataImplToJson(
      this,
    );
  }
}

abstract class _MeshNetworkEventData implements MeshNetworkEventData {
  const factory _MeshNetworkEventData(final String id) =
      _$MeshNetworkEventDataImpl;

  factory _MeshNetworkEventData.fromJson(Map<String, dynamic> json) =
      _$MeshNetworkEventDataImpl.fromJson;

  @override
  String get id;

  /// Create a copy of MeshNetworkEventData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeshNetworkEventDataImplCopyWith<_$MeshNetworkEventDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MeshNetworkEventError _$MeshNetworkEventErrorFromJson(
    Map<String, dynamic> json) {
  return _MeshNetworkEventError.fromJson(json);
}

/// @nodoc
mixin _$MeshNetworkEventError {
  String get error => throw _privateConstructorUsedError;

  /// Serializes this MeshNetworkEventError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeshNetworkEventError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeshNetworkEventErrorCopyWith<MeshNetworkEventError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeshNetworkEventErrorCopyWith<$Res> {
  factory $MeshNetworkEventErrorCopyWith(MeshNetworkEventError value,
          $Res Function(MeshNetworkEventError) then) =
      _$MeshNetworkEventErrorCopyWithImpl<$Res, MeshNetworkEventError>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$MeshNetworkEventErrorCopyWithImpl<$Res,
        $Val extends MeshNetworkEventError>
    implements $MeshNetworkEventErrorCopyWith<$Res> {
  _$MeshNetworkEventErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeshNetworkEventError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeshNetworkEventErrorImplCopyWith<$Res>
    implements $MeshNetworkEventErrorCopyWith<$Res> {
  factory _$$MeshNetworkEventErrorImplCopyWith(
          _$MeshNetworkEventErrorImpl value,
          $Res Function(_$MeshNetworkEventErrorImpl) then) =
      __$$MeshNetworkEventErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MeshNetworkEventErrorImplCopyWithImpl<$Res>
    extends _$MeshNetworkEventErrorCopyWithImpl<$Res,
        _$MeshNetworkEventErrorImpl>
    implements _$$MeshNetworkEventErrorImplCopyWith<$Res> {
  __$$MeshNetworkEventErrorImplCopyWithImpl(_$MeshNetworkEventErrorImpl _value,
      $Res Function(_$MeshNetworkEventErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeshNetworkEventError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MeshNetworkEventErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeshNetworkEventErrorImpl implements _MeshNetworkEventError {
  const _$MeshNetworkEventErrorImpl(this.error);

  factory _$MeshNetworkEventErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeshNetworkEventErrorImplFromJson(json);

  @override
  final String error;

  @override
  String toString() {
    return 'MeshNetworkEventError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshNetworkEventErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of MeshNetworkEventError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshNetworkEventErrorImplCopyWith<_$MeshNetworkEventErrorImpl>
      get copyWith => __$$MeshNetworkEventErrorImplCopyWithImpl<
          _$MeshNetworkEventErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeshNetworkEventErrorImplToJson(
      this,
    );
  }
}

abstract class _MeshNetworkEventError implements MeshNetworkEventError {
  const factory _MeshNetworkEventError(final String error) =
      _$MeshNetworkEventErrorImpl;

  factory _MeshNetworkEventError.fromJson(Map<String, dynamic> json) =
      _$MeshNetworkEventErrorImpl.fromJson;

  @override
  String get error;

  /// Create a copy of MeshNetworkEventError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeshNetworkEventErrorImplCopyWith<_$MeshNetworkEventErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
