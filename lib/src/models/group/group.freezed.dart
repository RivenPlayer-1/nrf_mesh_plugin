// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupData _$GroupDataFromJson(Map<String, dynamic> json) {
  return _GroupData.fromJson(json);
}

/// @nodoc
mixin _$GroupData {
  String get name => throw _privateConstructorUsedError;
  int get address => throw _privateConstructorUsedError;
  String? get addressLabel => throw _privateConstructorUsedError;
  String get meshUuid => throw _privateConstructorUsedError;
  int get parentAddress => throw _privateConstructorUsedError;
  String? get parentAddressLabel => throw _privateConstructorUsedError;

  /// Serializes this GroupData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupDataCopyWith<GroupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDataCopyWith<$Res> {
  factory $GroupDataCopyWith(GroupData value, $Res Function(GroupData) then) =
      _$GroupDataCopyWithImpl<$Res, GroupData>;
  @useResult
  $Res call(
      {String name,
      int address,
      String? addressLabel,
      String meshUuid,
      int parentAddress,
      String? parentAddressLabel});
}

/// @nodoc
class _$GroupDataCopyWithImpl<$Res, $Val extends GroupData>
    implements $GroupDataCopyWith<$Res> {
  _$GroupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? addressLabel = freezed,
    Object? meshUuid = null,
    Object? parentAddress = null,
    Object? parentAddressLabel = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as int,
      addressLabel: freezed == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      meshUuid: null == meshUuid
          ? _value.meshUuid
          : meshUuid // ignore: cast_nullable_to_non_nullable
              as String,
      parentAddress: null == parentAddress
          ? _value.parentAddress
          : parentAddress // ignore: cast_nullable_to_non_nullable
              as int,
      parentAddressLabel: freezed == parentAddressLabel
          ? _value.parentAddressLabel
          : parentAddressLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupDataImplCopyWith<$Res>
    implements $GroupDataCopyWith<$Res> {
  factory _$$GroupDataImplCopyWith(
          _$GroupDataImpl value, $Res Function(_$GroupDataImpl) then) =
      __$$GroupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int address,
      String? addressLabel,
      String meshUuid,
      int parentAddress,
      String? parentAddressLabel});
}

/// @nodoc
class __$$GroupDataImplCopyWithImpl<$Res>
    extends _$GroupDataCopyWithImpl<$Res, _$GroupDataImpl>
    implements _$$GroupDataImplCopyWith<$Res> {
  __$$GroupDataImplCopyWithImpl(
      _$GroupDataImpl _value, $Res Function(_$GroupDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? addressLabel = freezed,
    Object? meshUuid = null,
    Object? parentAddress = null,
    Object? parentAddressLabel = freezed,
  }) {
    return _then(_$GroupDataImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      null == meshUuid
          ? _value.meshUuid
          : meshUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == parentAddress
          ? _value.parentAddress
          : parentAddress // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == parentAddressLabel
          ? _value.parentAddressLabel
          : parentAddressLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupDataImpl implements _GroupData {
  const _$GroupDataImpl(this.name, this.address, this.addressLabel,
      this.meshUuid, this.parentAddress, this.parentAddressLabel);

  factory _$GroupDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupDataImplFromJson(json);

  @override
  final String name;
  @override
  final int address;
  @override
  final String? addressLabel;
  @override
  final String meshUuid;
  @override
  final int parentAddress;
  @override
  final String? parentAddressLabel;

  @override
  String toString() {
    return 'GroupData(name: $name, address: $address, addressLabel: $addressLabel, meshUuid: $meshUuid, parentAddress: $parentAddress, parentAddressLabel: $parentAddressLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressLabel, addressLabel) ||
                other.addressLabel == addressLabel) &&
            (identical(other.meshUuid, meshUuid) ||
                other.meshUuid == meshUuid) &&
            (identical(other.parentAddress, parentAddress) ||
                other.parentAddress == parentAddress) &&
            (identical(other.parentAddressLabel, parentAddressLabel) ||
                other.parentAddressLabel == parentAddressLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, address, addressLabel,
      meshUuid, parentAddress, parentAddressLabel);

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDataImplCopyWith<_$GroupDataImpl> get copyWith =>
      __$$GroupDataImplCopyWithImpl<_$GroupDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupDataImplToJson(
      this,
    );
  }
}

abstract class _GroupData implements GroupData {
  const factory _GroupData(
      final String name,
      final int address,
      final String? addressLabel,
      final String meshUuid,
      final int parentAddress,
      final String? parentAddressLabel) = _$GroupDataImpl;

  factory _GroupData.fromJson(Map<String, dynamic> json) =
      _$GroupDataImpl.fromJson;

  @override
  String get name;
  @override
  int get address;
  @override
  String? get addressLabel;
  @override
  String get meshUuid;
  @override
  int get parentAddress;
  @override
  String? get parentAddressLabel;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupDataImplCopyWith<_$GroupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
