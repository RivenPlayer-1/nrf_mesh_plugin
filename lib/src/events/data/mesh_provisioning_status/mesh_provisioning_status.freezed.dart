// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mesh_provisioning_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnprovisionedMeshNodeData _$UnprovisionedMeshNodeDataFromJson(
    Map<String, dynamic> json) {
  return _UnprovisionedMeshNodeData.fromJson(json);
}

/// @nodoc
mixin _$UnprovisionedMeshNodeData {
  String get uuid => throw _privateConstructorUsedError;
  List<int>? get provisionerPublicKeyXY => throw _privateConstructorUsedError;

  /// Serializes this UnprovisionedMeshNodeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnprovisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnprovisionedMeshNodeDataCopyWith<UnprovisionedMeshNodeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnprovisionedMeshNodeDataCopyWith<$Res> {
  factory $UnprovisionedMeshNodeDataCopyWith(UnprovisionedMeshNodeData value,
          $Res Function(UnprovisionedMeshNodeData) then) =
      _$UnprovisionedMeshNodeDataCopyWithImpl<$Res, UnprovisionedMeshNodeData>;
  @useResult
  $Res call({String uuid, List<int>? provisionerPublicKeyXY});
}

/// @nodoc
class _$UnprovisionedMeshNodeDataCopyWithImpl<$Res,
        $Val extends UnprovisionedMeshNodeData>
    implements $UnprovisionedMeshNodeDataCopyWith<$Res> {
  _$UnprovisionedMeshNodeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnprovisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? provisionerPublicKeyXY = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      provisionerPublicKeyXY: freezed == provisionerPublicKeyXY
          ? _value.provisionerPublicKeyXY
          : provisionerPublicKeyXY // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnprovisionedMeshNodeDataImplCopyWith<$Res>
    implements $UnprovisionedMeshNodeDataCopyWith<$Res> {
  factory _$$UnprovisionedMeshNodeDataImplCopyWith(
          _$UnprovisionedMeshNodeDataImpl value,
          $Res Function(_$UnprovisionedMeshNodeDataImpl) then) =
      __$$UnprovisionedMeshNodeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, List<int>? provisionerPublicKeyXY});
}

/// @nodoc
class __$$UnprovisionedMeshNodeDataImplCopyWithImpl<$Res>
    extends _$UnprovisionedMeshNodeDataCopyWithImpl<$Res,
        _$UnprovisionedMeshNodeDataImpl>
    implements _$$UnprovisionedMeshNodeDataImplCopyWith<$Res> {
  __$$UnprovisionedMeshNodeDataImplCopyWithImpl(
      _$UnprovisionedMeshNodeDataImpl _value,
      $Res Function(_$UnprovisionedMeshNodeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnprovisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? provisionerPublicKeyXY = freezed,
  }) {
    return _then(_$UnprovisionedMeshNodeDataImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      provisionerPublicKeyXY: freezed == provisionerPublicKeyXY
          ? _value._provisionerPublicKeyXY
          : provisionerPublicKeyXY // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnprovisionedMeshNodeDataImpl implements _UnprovisionedMeshNodeData {
  const _$UnprovisionedMeshNodeDataImpl(this.uuid,
      {final List<int>? provisionerPublicKeyXY = const []})
      : _provisionerPublicKeyXY = provisionerPublicKeyXY;

  factory _$UnprovisionedMeshNodeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnprovisionedMeshNodeDataImplFromJson(json);

  @override
  final String uuid;
  final List<int>? _provisionerPublicKeyXY;
  @override
  @JsonKey()
  List<int>? get provisionerPublicKeyXY {
    final value = _provisionerPublicKeyXY;
    if (value == null) return null;
    if (_provisionerPublicKeyXY is EqualUnmodifiableListView)
      return _provisionerPublicKeyXY;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UnprovisionedMeshNodeData(uuid: $uuid, provisionerPublicKeyXY: $provisionerPublicKeyXY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnprovisionedMeshNodeDataImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(
                other._provisionerPublicKeyXY, _provisionerPublicKeyXY));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid,
      const DeepCollectionEquality().hash(_provisionerPublicKeyXY));

  /// Create a copy of UnprovisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnprovisionedMeshNodeDataImplCopyWith<_$UnprovisionedMeshNodeDataImpl>
      get copyWith => __$$UnprovisionedMeshNodeDataImplCopyWithImpl<
          _$UnprovisionedMeshNodeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnprovisionedMeshNodeDataImplToJson(
      this,
    );
  }
}

abstract class _UnprovisionedMeshNodeData implements UnprovisionedMeshNodeData {
  const factory _UnprovisionedMeshNodeData(final String uuid,
          {final List<int>? provisionerPublicKeyXY}) =
      _$UnprovisionedMeshNodeDataImpl;

  factory _UnprovisionedMeshNodeData.fromJson(Map<String, dynamic> json) =
      _$UnprovisionedMeshNodeDataImpl.fromJson;

  @override
  String get uuid;
  @override
  List<int>? get provisionerPublicKeyXY;

  /// Create a copy of UnprovisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnprovisionedMeshNodeDataImplCopyWith<_$UnprovisionedMeshNodeDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProvisionedMeshNodeData _$ProvisionedMeshNodeDataFromJson(
    Map<String, dynamic> json) {
  return _ProvisionedMeshNodeData.fromJson(json);
}

/// @nodoc
mixin _$ProvisionedMeshNodeData {
  String get uuid => throw _privateConstructorUsedError;

  /// Serializes this ProvisionedMeshNodeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvisionedMeshNodeDataCopyWith<ProvisionedMeshNodeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvisionedMeshNodeDataCopyWith<$Res> {
  factory $ProvisionedMeshNodeDataCopyWith(ProvisionedMeshNodeData value,
          $Res Function(ProvisionedMeshNodeData) then) =
      _$ProvisionedMeshNodeDataCopyWithImpl<$Res, ProvisionedMeshNodeData>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class _$ProvisionedMeshNodeDataCopyWithImpl<$Res,
        $Val extends ProvisionedMeshNodeData>
    implements $ProvisionedMeshNodeDataCopyWith<$Res> {
  _$ProvisionedMeshNodeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvisionedMeshNodeDataImplCopyWith<$Res>
    implements $ProvisionedMeshNodeDataCopyWith<$Res> {
  factory _$$ProvisionedMeshNodeDataImplCopyWith(
          _$ProvisionedMeshNodeDataImpl value,
          $Res Function(_$ProvisionedMeshNodeDataImpl) then) =
      __$$ProvisionedMeshNodeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$ProvisionedMeshNodeDataImplCopyWithImpl<$Res>
    extends _$ProvisionedMeshNodeDataCopyWithImpl<$Res,
        _$ProvisionedMeshNodeDataImpl>
    implements _$$ProvisionedMeshNodeDataImplCopyWith<$Res> {
  __$$ProvisionedMeshNodeDataImplCopyWithImpl(
      _$ProvisionedMeshNodeDataImpl _value,
      $Res Function(_$ProvisionedMeshNodeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProvisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$ProvisionedMeshNodeDataImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvisionedMeshNodeDataImpl implements _ProvisionedMeshNodeData {
  const _$ProvisionedMeshNodeDataImpl(this.uuid);

  factory _$ProvisionedMeshNodeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvisionedMeshNodeDataImplFromJson(json);

  @override
  final String uuid;

  @override
  String toString() {
    return 'ProvisionedMeshNodeData(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvisionedMeshNodeDataImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of ProvisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvisionedMeshNodeDataImplCopyWith<_$ProvisionedMeshNodeDataImpl>
      get copyWith => __$$ProvisionedMeshNodeDataImplCopyWithImpl<
          _$ProvisionedMeshNodeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvisionedMeshNodeDataImplToJson(
      this,
    );
  }
}

abstract class _ProvisionedMeshNodeData implements ProvisionedMeshNodeData {
  const factory _ProvisionedMeshNodeData(final String uuid) =
      _$ProvisionedMeshNodeDataImpl;

  factory _ProvisionedMeshNodeData.fromJson(Map<String, dynamic> json) =
      _$ProvisionedMeshNodeDataImpl.fromJson;

  @override
  String get uuid;

  /// Create a copy of ProvisionedMeshNodeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvisionedMeshNodeDataImplCopyWith<_$ProvisionedMeshNodeDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MeshProvisioningStatusData _$MeshProvisioningStatusDataFromJson(
    Map<String, dynamic> json) {
  return _MeshProvisioningStatusData.fromJson(json);
}

/// @nodoc
mixin _$MeshProvisioningStatusData {
  String get state => throw _privateConstructorUsedError;
  List<int> get data => throw _privateConstructorUsedError;
  UnprovisionedMeshNodeData? get meshNode => throw _privateConstructorUsedError;

  /// Serializes this MeshProvisioningStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeshProvisioningStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeshProvisioningStatusDataCopyWith<MeshProvisioningStatusData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeshProvisioningStatusDataCopyWith<$Res> {
  factory $MeshProvisioningStatusDataCopyWith(MeshProvisioningStatusData value,
          $Res Function(MeshProvisioningStatusData) then) =
      _$MeshProvisioningStatusDataCopyWithImpl<$Res,
          MeshProvisioningStatusData>;
  @useResult
  $Res call(
      {String state, List<int> data, UnprovisionedMeshNodeData? meshNode});

  $UnprovisionedMeshNodeDataCopyWith<$Res>? get meshNode;
}

/// @nodoc
class _$MeshProvisioningStatusDataCopyWithImpl<$Res,
        $Val extends MeshProvisioningStatusData>
    implements $MeshProvisioningStatusDataCopyWith<$Res> {
  _$MeshProvisioningStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeshProvisioningStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? meshNode = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      meshNode: freezed == meshNode
          ? _value.meshNode
          : meshNode // ignore: cast_nullable_to_non_nullable
              as UnprovisionedMeshNodeData?,
    ) as $Val);
  }

  /// Create a copy of MeshProvisioningStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnprovisionedMeshNodeDataCopyWith<$Res>? get meshNode {
    if (_value.meshNode == null) {
      return null;
    }

    return $UnprovisionedMeshNodeDataCopyWith<$Res>(_value.meshNode!, (value) {
      return _then(_value.copyWith(meshNode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeshProvisioningStatusDataImplCopyWith<$Res>
    implements $MeshProvisioningStatusDataCopyWith<$Res> {
  factory _$$MeshProvisioningStatusDataImplCopyWith(
          _$MeshProvisioningStatusDataImpl value,
          $Res Function(_$MeshProvisioningStatusDataImpl) then) =
      __$$MeshProvisioningStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String state, List<int> data, UnprovisionedMeshNodeData? meshNode});

  @override
  $UnprovisionedMeshNodeDataCopyWith<$Res>? get meshNode;
}

/// @nodoc
class __$$MeshProvisioningStatusDataImplCopyWithImpl<$Res>
    extends _$MeshProvisioningStatusDataCopyWithImpl<$Res,
        _$MeshProvisioningStatusDataImpl>
    implements _$$MeshProvisioningStatusDataImplCopyWith<$Res> {
  __$$MeshProvisioningStatusDataImplCopyWithImpl(
      _$MeshProvisioningStatusDataImpl _value,
      $Res Function(_$MeshProvisioningStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeshProvisioningStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? meshNode = freezed,
  }) {
    return _then(_$MeshProvisioningStatusDataImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      freezed == meshNode
          ? _value.meshNode
          : meshNode // ignore: cast_nullable_to_non_nullable
              as UnprovisionedMeshNodeData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$MeshProvisioningStatusDataImpl implements _MeshProvisioningStatusData {
  const _$MeshProvisioningStatusDataImpl(
      this.state, final List<int> data, this.meshNode)
      : _data = data;

  factory _$MeshProvisioningStatusDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MeshProvisioningStatusDataImplFromJson(json);

  @override
  final String state;
  final List<int> _data;
  @override
  List<int> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final UnprovisionedMeshNodeData? meshNode;

  @override
  String toString() {
    return 'MeshProvisioningStatusData(state: $state, data: $data, meshNode: $meshNode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshProvisioningStatusDataImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meshNode, meshNode) ||
                other.meshNode == meshNode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, state, const DeepCollectionEquality().hash(_data), meshNode);

  /// Create a copy of MeshProvisioningStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshProvisioningStatusDataImplCopyWith<_$MeshProvisioningStatusDataImpl>
      get copyWith => __$$MeshProvisioningStatusDataImplCopyWithImpl<
          _$MeshProvisioningStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeshProvisioningStatusDataImplToJson(
      this,
    );
  }
}

abstract class _MeshProvisioningStatusData
    implements MeshProvisioningStatusData {
  const factory _MeshProvisioningStatusData(final String state,
          final List<int> data, final UnprovisionedMeshNodeData? meshNode) =
      _$MeshProvisioningStatusDataImpl;

  factory _MeshProvisioningStatusData.fromJson(Map<String, dynamic> json) =
      _$MeshProvisioningStatusDataImpl.fromJson;

  @override
  String get state;
  @override
  List<int> get data;
  @override
  UnprovisionedMeshNodeData? get meshNode;

  /// Create a copy of MeshProvisioningStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeshProvisioningStatusDataImplCopyWith<_$MeshProvisioningStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MeshProvisioningCompletedData _$MeshProvisioningCompletedDataFromJson(
    Map<String, dynamic> json) {
  return _MeshProvisioningCompletedData.fromJson(json);
}

/// @nodoc
mixin _$MeshProvisioningCompletedData {
  String get state => throw _privateConstructorUsedError;
  List<int> get data => throw _privateConstructorUsedError;
  ProvisionedMeshNodeData? get meshNode => throw _privateConstructorUsedError;

  /// Serializes this MeshProvisioningCompletedData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeshProvisioningCompletedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeshProvisioningCompletedDataCopyWith<MeshProvisioningCompletedData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeshProvisioningCompletedDataCopyWith<$Res> {
  factory $MeshProvisioningCompletedDataCopyWith(
          MeshProvisioningCompletedData value,
          $Res Function(MeshProvisioningCompletedData) then) =
      _$MeshProvisioningCompletedDataCopyWithImpl<$Res,
          MeshProvisioningCompletedData>;
  @useResult
  $Res call({String state, List<int> data, ProvisionedMeshNodeData? meshNode});

  $ProvisionedMeshNodeDataCopyWith<$Res>? get meshNode;
}

/// @nodoc
class _$MeshProvisioningCompletedDataCopyWithImpl<$Res,
        $Val extends MeshProvisioningCompletedData>
    implements $MeshProvisioningCompletedDataCopyWith<$Res> {
  _$MeshProvisioningCompletedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeshProvisioningCompletedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? meshNode = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      meshNode: freezed == meshNode
          ? _value.meshNode
          : meshNode // ignore: cast_nullable_to_non_nullable
              as ProvisionedMeshNodeData?,
    ) as $Val);
  }

  /// Create a copy of MeshProvisioningCompletedData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProvisionedMeshNodeDataCopyWith<$Res>? get meshNode {
    if (_value.meshNode == null) {
      return null;
    }

    return $ProvisionedMeshNodeDataCopyWith<$Res>(_value.meshNode!, (value) {
      return _then(_value.copyWith(meshNode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeshProvisioningCompletedDataImplCopyWith<$Res>
    implements $MeshProvisioningCompletedDataCopyWith<$Res> {
  factory _$$MeshProvisioningCompletedDataImplCopyWith(
          _$MeshProvisioningCompletedDataImpl value,
          $Res Function(_$MeshProvisioningCompletedDataImpl) then) =
      __$$MeshProvisioningCompletedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String state, List<int> data, ProvisionedMeshNodeData? meshNode});

  @override
  $ProvisionedMeshNodeDataCopyWith<$Res>? get meshNode;
}

/// @nodoc
class __$$MeshProvisioningCompletedDataImplCopyWithImpl<$Res>
    extends _$MeshProvisioningCompletedDataCopyWithImpl<$Res,
        _$MeshProvisioningCompletedDataImpl>
    implements _$$MeshProvisioningCompletedDataImplCopyWith<$Res> {
  __$$MeshProvisioningCompletedDataImplCopyWithImpl(
      _$MeshProvisioningCompletedDataImpl _value,
      $Res Function(_$MeshProvisioningCompletedDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeshProvisioningCompletedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? meshNode = freezed,
  }) {
    return _then(_$MeshProvisioningCompletedDataImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      freezed == meshNode
          ? _value.meshNode
          : meshNode // ignore: cast_nullable_to_non_nullable
              as ProvisionedMeshNodeData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$MeshProvisioningCompletedDataImpl
    implements _MeshProvisioningCompletedData {
  const _$MeshProvisioningCompletedDataImpl(
      this.state, final List<int> data, this.meshNode)
      : _data = data;

  factory _$MeshProvisioningCompletedDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MeshProvisioningCompletedDataImplFromJson(json);

  @override
  final String state;
  final List<int> _data;
  @override
  List<int> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final ProvisionedMeshNodeData? meshNode;

  @override
  String toString() {
    return 'MeshProvisioningCompletedData(state: $state, data: $data, meshNode: $meshNode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshProvisioningCompletedDataImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meshNode, meshNode) ||
                other.meshNode == meshNode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, state, const DeepCollectionEquality().hash(_data), meshNode);

  /// Create a copy of MeshProvisioningCompletedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshProvisioningCompletedDataImplCopyWith<
          _$MeshProvisioningCompletedDataImpl>
      get copyWith => __$$MeshProvisioningCompletedDataImplCopyWithImpl<
          _$MeshProvisioningCompletedDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeshProvisioningCompletedDataImplToJson(
      this,
    );
  }
}

abstract class _MeshProvisioningCompletedData
    implements MeshProvisioningCompletedData {
  const factory _MeshProvisioningCompletedData(final String state,
          final List<int> data, final ProvisionedMeshNodeData? meshNode) =
      _$MeshProvisioningCompletedDataImpl;

  factory _MeshProvisioningCompletedData.fromJson(Map<String, dynamic> json) =
      _$MeshProvisioningCompletedDataImpl.fromJson;

  @override
  String get state;
  @override
  List<int> get data;
  @override
  ProvisionedMeshNodeData? get meshNode;

  /// Create a copy of MeshProvisioningCompletedData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeshProvisioningCompletedDataImplCopyWith<
          _$MeshProvisioningCompletedDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
