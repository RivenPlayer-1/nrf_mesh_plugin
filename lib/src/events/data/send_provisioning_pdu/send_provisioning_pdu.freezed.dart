// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_provisioning_pdu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendProvisioningPduData _$SendProvisioningPduDataFromJson(
    Map<String, dynamic> json) {
  return _SendProvisioningPduData.fromJson(json);
}

/// @nodoc
mixin _$SendProvisioningPduData {
  List<int> get pdu => throw _privateConstructorUsedError;
  UnprovisionedMeshNode get meshNode => throw _privateConstructorUsedError;

  /// Serializes this SendProvisioningPduData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendProvisioningPduData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendProvisioningPduDataCopyWith<SendProvisioningPduData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendProvisioningPduDataCopyWith<$Res> {
  factory $SendProvisioningPduDataCopyWith(SendProvisioningPduData value,
          $Res Function(SendProvisioningPduData) then) =
      _$SendProvisioningPduDataCopyWithImpl<$Res, SendProvisioningPduData>;
  @useResult
  $Res call({List<int> pdu, UnprovisionedMeshNode meshNode});
}

/// @nodoc
class _$SendProvisioningPduDataCopyWithImpl<$Res,
        $Val extends SendProvisioningPduData>
    implements $SendProvisioningPduDataCopyWith<$Res> {
  _$SendProvisioningPduDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendProvisioningPduData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdu = null,
    Object? meshNode = null,
  }) {
    return _then(_value.copyWith(
      pdu: null == pdu
          ? _value.pdu
          : pdu // ignore: cast_nullable_to_non_nullable
              as List<int>,
      meshNode: null == meshNode
          ? _value.meshNode
          : meshNode // ignore: cast_nullable_to_non_nullable
              as UnprovisionedMeshNode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendProvisioningPduDataImplCopyWith<$Res>
    implements $SendProvisioningPduDataCopyWith<$Res> {
  factory _$$SendProvisioningPduDataImplCopyWith(
          _$SendProvisioningPduDataImpl value,
          $Res Function(_$SendProvisioningPduDataImpl) then) =
      __$$SendProvisioningPduDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> pdu, UnprovisionedMeshNode meshNode});
}

/// @nodoc
class __$$SendProvisioningPduDataImplCopyWithImpl<$Res>
    extends _$SendProvisioningPduDataCopyWithImpl<$Res,
        _$SendProvisioningPduDataImpl>
    implements _$$SendProvisioningPduDataImplCopyWith<$Res> {
  __$$SendProvisioningPduDataImplCopyWithImpl(
      _$SendProvisioningPduDataImpl _value,
      $Res Function(_$SendProvisioningPduDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendProvisioningPduData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdu = null,
    Object? meshNode = null,
  }) {
    return _then(_$SendProvisioningPduDataImpl(
      null == pdu
          ? _value._pdu
          : pdu // ignore: cast_nullable_to_non_nullable
              as List<int>,
      null == meshNode
          ? _value.meshNode
          : meshNode // ignore: cast_nullable_to_non_nullable
              as UnprovisionedMeshNode,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$SendProvisioningPduDataImpl implements _SendProvisioningPduData {
  const _$SendProvisioningPduDataImpl(final List<int> pdu, this.meshNode)
      : _pdu = pdu;

  factory _$SendProvisioningPduDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendProvisioningPduDataImplFromJson(json);

  final List<int> _pdu;
  @override
  List<int> get pdu {
    if (_pdu is EqualUnmodifiableListView) return _pdu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pdu);
  }

  @override
  final UnprovisionedMeshNode meshNode;

  @override
  String toString() {
    return 'SendProvisioningPduData(pdu: $pdu, meshNode: $meshNode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendProvisioningPduDataImpl &&
            const DeepCollectionEquality().equals(other._pdu, _pdu) &&
            (identical(other.meshNode, meshNode) ||
                other.meshNode == meshNode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pdu), meshNode);

  /// Create a copy of SendProvisioningPduData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendProvisioningPduDataImplCopyWith<_$SendProvisioningPduDataImpl>
      get copyWith => __$$SendProvisioningPduDataImplCopyWithImpl<
          _$SendProvisioningPduDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendProvisioningPduDataImplToJson(
      this,
    );
  }
}

abstract class _SendProvisioningPduData implements SendProvisioningPduData {
  const factory _SendProvisioningPduData(
          final List<int> pdu, final UnprovisionedMeshNode meshNode) =
      _$SendProvisioningPduDataImpl;

  factory _SendProvisioningPduData.fromJson(Map<String, dynamic> json) =
      _$SendProvisioningPduDataImpl.fromJson;

  @override
  List<int> get pdu;
  @override
  UnprovisionedMeshNode get meshNode;

  /// Create a copy of SendProvisioningPduData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendProvisioningPduDataImplCopyWith<_$SendProvisioningPduDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
