// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provisioner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Provisioner _$ProvisionerFromJson(Map<String, dynamic> json) {
  return _Provisioner.fromJson(json);
}

/// @nodoc
mixin _$Provisioner {
  String get provisionerName => throw _privateConstructorUsedError;
  String get provisionerUuid => throw _privateConstructorUsedError;
  int get globalTtl => throw _privateConstructorUsedError;
  int get provisionerAddress => throw _privateConstructorUsedError;
  List<AllocatedUnicastRange> get allocatedUnicastRanges =>
      throw _privateConstructorUsedError;
  List<AllocatedGroupRange> get allocatedGroupRanges =>
      throw _privateConstructorUsedError;
  List<AllocatedSceneRange> get allocatedSceneRanges =>
      throw _privateConstructorUsedError;
  bool get lastSelected => throw _privateConstructorUsedError;

  /// Serializes this Provisioner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Provisioner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvisionerCopyWith<Provisioner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvisionerCopyWith<$Res> {
  factory $ProvisionerCopyWith(
          Provisioner value, $Res Function(Provisioner) then) =
      _$ProvisionerCopyWithImpl<$Res, Provisioner>;
  @useResult
  $Res call(
      {String provisionerName,
      String provisionerUuid,
      int globalTtl,
      int provisionerAddress,
      List<AllocatedUnicastRange> allocatedUnicastRanges,
      List<AllocatedGroupRange> allocatedGroupRanges,
      List<AllocatedSceneRange> allocatedSceneRanges,
      bool lastSelected});
}

/// @nodoc
class _$ProvisionerCopyWithImpl<$Res, $Val extends Provisioner>
    implements $ProvisionerCopyWith<$Res> {
  _$ProvisionerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Provisioner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provisionerName = null,
    Object? provisionerUuid = null,
    Object? globalTtl = null,
    Object? provisionerAddress = null,
    Object? allocatedUnicastRanges = null,
    Object? allocatedGroupRanges = null,
    Object? allocatedSceneRanges = null,
    Object? lastSelected = null,
  }) {
    return _then(_value.copyWith(
      provisionerName: null == provisionerName
          ? _value.provisionerName
          : provisionerName // ignore: cast_nullable_to_non_nullable
              as String,
      provisionerUuid: null == provisionerUuid
          ? _value.provisionerUuid
          : provisionerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      globalTtl: null == globalTtl
          ? _value.globalTtl
          : globalTtl // ignore: cast_nullable_to_non_nullable
              as int,
      provisionerAddress: null == provisionerAddress
          ? _value.provisionerAddress
          : provisionerAddress // ignore: cast_nullable_to_non_nullable
              as int,
      allocatedUnicastRanges: null == allocatedUnicastRanges
          ? _value.allocatedUnicastRanges
          : allocatedUnicastRanges // ignore: cast_nullable_to_non_nullable
              as List<AllocatedUnicastRange>,
      allocatedGroupRanges: null == allocatedGroupRanges
          ? _value.allocatedGroupRanges
          : allocatedGroupRanges // ignore: cast_nullable_to_non_nullable
              as List<AllocatedGroupRange>,
      allocatedSceneRanges: null == allocatedSceneRanges
          ? _value.allocatedSceneRanges
          : allocatedSceneRanges // ignore: cast_nullable_to_non_nullable
              as List<AllocatedSceneRange>,
      lastSelected: null == lastSelected
          ? _value.lastSelected
          : lastSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvisionerImplCopyWith<$Res>
    implements $ProvisionerCopyWith<$Res> {
  factory _$$ProvisionerImplCopyWith(
          _$ProvisionerImpl value, $Res Function(_$ProvisionerImpl) then) =
      __$$ProvisionerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String provisionerName,
      String provisionerUuid,
      int globalTtl,
      int provisionerAddress,
      List<AllocatedUnicastRange> allocatedUnicastRanges,
      List<AllocatedGroupRange> allocatedGroupRanges,
      List<AllocatedSceneRange> allocatedSceneRanges,
      bool lastSelected});
}

/// @nodoc
class __$$ProvisionerImplCopyWithImpl<$Res>
    extends _$ProvisionerCopyWithImpl<$Res, _$ProvisionerImpl>
    implements _$$ProvisionerImplCopyWith<$Res> {
  __$$ProvisionerImplCopyWithImpl(
      _$ProvisionerImpl _value, $Res Function(_$ProvisionerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Provisioner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provisionerName = null,
    Object? provisionerUuid = null,
    Object? globalTtl = null,
    Object? provisionerAddress = null,
    Object? allocatedUnicastRanges = null,
    Object? allocatedGroupRanges = null,
    Object? allocatedSceneRanges = null,
    Object? lastSelected = null,
  }) {
    return _then(_$ProvisionerImpl(
      null == provisionerName
          ? _value.provisionerName
          : provisionerName // ignore: cast_nullable_to_non_nullable
              as String,
      null == provisionerUuid
          ? _value.provisionerUuid
          : provisionerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == globalTtl
          ? _value.globalTtl
          : globalTtl // ignore: cast_nullable_to_non_nullable
              as int,
      null == provisionerAddress
          ? _value.provisionerAddress
          : provisionerAddress // ignore: cast_nullable_to_non_nullable
              as int,
      null == allocatedUnicastRanges
          ? _value._allocatedUnicastRanges
          : allocatedUnicastRanges // ignore: cast_nullable_to_non_nullable
              as List<AllocatedUnicastRange>,
      null == allocatedGroupRanges
          ? _value._allocatedGroupRanges
          : allocatedGroupRanges // ignore: cast_nullable_to_non_nullable
              as List<AllocatedGroupRange>,
      null == allocatedSceneRanges
          ? _value._allocatedSceneRanges
          : allocatedSceneRanges // ignore: cast_nullable_to_non_nullable
              as List<AllocatedSceneRange>,
      null == lastSelected
          ? _value.lastSelected
          : lastSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvisionerImpl implements _Provisioner {
  const _$ProvisionerImpl(
      this.provisionerName,
      this.provisionerUuid,
      this.globalTtl,
      this.provisionerAddress,
      final List<AllocatedUnicastRange> allocatedUnicastRanges,
      final List<AllocatedGroupRange> allocatedGroupRanges,
      final List<AllocatedSceneRange> allocatedSceneRanges,
      this.lastSelected)
      : _allocatedUnicastRanges = allocatedUnicastRanges,
        _allocatedGroupRanges = allocatedGroupRanges,
        _allocatedSceneRanges = allocatedSceneRanges;

  factory _$ProvisionerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvisionerImplFromJson(json);

  @override
  final String provisionerName;
  @override
  final String provisionerUuid;
  @override
  final int globalTtl;
  @override
  final int provisionerAddress;
  final List<AllocatedUnicastRange> _allocatedUnicastRanges;
  @override
  List<AllocatedUnicastRange> get allocatedUnicastRanges {
    if (_allocatedUnicastRanges is EqualUnmodifiableListView)
      return _allocatedUnicastRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocatedUnicastRanges);
  }

  final List<AllocatedGroupRange> _allocatedGroupRanges;
  @override
  List<AllocatedGroupRange> get allocatedGroupRanges {
    if (_allocatedGroupRanges is EqualUnmodifiableListView)
      return _allocatedGroupRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocatedGroupRanges);
  }

  final List<AllocatedSceneRange> _allocatedSceneRanges;
  @override
  List<AllocatedSceneRange> get allocatedSceneRanges {
    if (_allocatedSceneRanges is EqualUnmodifiableListView)
      return _allocatedSceneRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocatedSceneRanges);
  }

  @override
  final bool lastSelected;

  @override
  String toString() {
    return 'Provisioner(provisionerName: $provisionerName, provisionerUuid: $provisionerUuid, globalTtl: $globalTtl, provisionerAddress: $provisionerAddress, allocatedUnicastRanges: $allocatedUnicastRanges, allocatedGroupRanges: $allocatedGroupRanges, allocatedSceneRanges: $allocatedSceneRanges, lastSelected: $lastSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvisionerImpl &&
            (identical(other.provisionerName, provisionerName) ||
                other.provisionerName == provisionerName) &&
            (identical(other.provisionerUuid, provisionerUuid) ||
                other.provisionerUuid == provisionerUuid) &&
            (identical(other.globalTtl, globalTtl) ||
                other.globalTtl == globalTtl) &&
            (identical(other.provisionerAddress, provisionerAddress) ||
                other.provisionerAddress == provisionerAddress) &&
            const DeepCollectionEquality().equals(
                other._allocatedUnicastRanges, _allocatedUnicastRanges) &&
            const DeepCollectionEquality()
                .equals(other._allocatedGroupRanges, _allocatedGroupRanges) &&
            const DeepCollectionEquality()
                .equals(other._allocatedSceneRanges, _allocatedSceneRanges) &&
            (identical(other.lastSelected, lastSelected) ||
                other.lastSelected == lastSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      provisionerName,
      provisionerUuid,
      globalTtl,
      provisionerAddress,
      const DeepCollectionEquality().hash(_allocatedUnicastRanges),
      const DeepCollectionEquality().hash(_allocatedGroupRanges),
      const DeepCollectionEquality().hash(_allocatedSceneRanges),
      lastSelected);

  /// Create a copy of Provisioner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvisionerImplCopyWith<_$ProvisionerImpl> get copyWith =>
      __$$ProvisionerImplCopyWithImpl<_$ProvisionerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvisionerImplToJson(
      this,
    );
  }
}

abstract class _Provisioner implements Provisioner {
  const factory _Provisioner(
      final String provisionerName,
      final String provisionerUuid,
      final int globalTtl,
      final int provisionerAddress,
      final List<AllocatedUnicastRange> allocatedUnicastRanges,
      final List<AllocatedGroupRange> allocatedGroupRanges,
      final List<AllocatedSceneRange> allocatedSceneRanges,
      final bool lastSelected) = _$ProvisionerImpl;

  factory _Provisioner.fromJson(Map<String, dynamic> json) =
      _$ProvisionerImpl.fromJson;

  @override
  String get provisionerName;
  @override
  String get provisionerUuid;
  @override
  int get globalTtl;
  @override
  int get provisionerAddress;
  @override
  List<AllocatedUnicastRange> get allocatedUnicastRanges;
  @override
  List<AllocatedGroupRange> get allocatedGroupRanges;
  @override
  List<AllocatedSceneRange> get allocatedSceneRanges;
  @override
  bool get lastSelected;

  /// Create a copy of Provisioner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvisionerImplCopyWith<_$ProvisionerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
