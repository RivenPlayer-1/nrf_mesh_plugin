// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NetworkKey _$NetworkKeyFromJson(Map<String, dynamic> json) {
  return _NetworkKey.fromJson(json);
}

/// @nodoc
mixin _$NetworkKey {
  String get name => throw _privateConstructorUsedError;
  int get netKeyIndex => throw _privateConstructorUsedError;
  int get phase => throw _privateConstructorUsedError;
  String get phaseDescription => throw _privateConstructorUsedError;
  bool get isMinSecurity => throw _privateConstructorUsedError;
  List<int> get netKeyBytes => throw _privateConstructorUsedError;
  List<int>? get oldNetKeyBytes => throw _privateConstructorUsedError;
  List<int> get txNetworkKey => throw _privateConstructorUsedError;
  List<int> get identityKey => throw _privateConstructorUsedError;
  List<int>? get oldIdentityKey => throw _privateConstructorUsedError;
  String get meshUuid => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  /// Serializes this NetworkKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkKeyCopyWith<NetworkKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkKeyCopyWith<$Res> {
  factory $NetworkKeyCopyWith(
          NetworkKey value, $Res Function(NetworkKey) then) =
      _$NetworkKeyCopyWithImpl<$Res, NetworkKey>;
  @useResult
  $Res call(
      {String name,
      int netKeyIndex,
      int phase,
      String phaseDescription,
      bool isMinSecurity,
      List<int> netKeyBytes,
      List<int>? oldNetKeyBytes,
      List<int> txNetworkKey,
      List<int> identityKey,
      List<int>? oldIdentityKey,
      String meshUuid,
      int timestamp});
}

/// @nodoc
class _$NetworkKeyCopyWithImpl<$Res, $Val extends NetworkKey>
    implements $NetworkKeyCopyWith<$Res> {
  _$NetworkKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? netKeyIndex = null,
    Object? phase = null,
    Object? phaseDescription = null,
    Object? isMinSecurity = null,
    Object? netKeyBytes = null,
    Object? oldNetKeyBytes = freezed,
    Object? txNetworkKey = null,
    Object? identityKey = null,
    Object? oldIdentityKey = freezed,
    Object? meshUuid = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      netKeyIndex: null == netKeyIndex
          ? _value.netKeyIndex
          : netKeyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
      phaseDescription: null == phaseDescription
          ? _value.phaseDescription
          : phaseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isMinSecurity: null == isMinSecurity
          ? _value.isMinSecurity
          : isMinSecurity // ignore: cast_nullable_to_non_nullable
              as bool,
      netKeyBytes: null == netKeyBytes
          ? _value.netKeyBytes
          : netKeyBytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      oldNetKeyBytes: freezed == oldNetKeyBytes
          ? _value.oldNetKeyBytes
          : oldNetKeyBytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      txNetworkKey: null == txNetworkKey
          ? _value.txNetworkKey
          : txNetworkKey // ignore: cast_nullable_to_non_nullable
              as List<int>,
      identityKey: null == identityKey
          ? _value.identityKey
          : identityKey // ignore: cast_nullable_to_non_nullable
              as List<int>,
      oldIdentityKey: freezed == oldIdentityKey
          ? _value.oldIdentityKey
          : oldIdentityKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      meshUuid: null == meshUuid
          ? _value.meshUuid
          : meshUuid // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkKeyImplCopyWith<$Res>
    implements $NetworkKeyCopyWith<$Res> {
  factory _$$NetworkKeyImplCopyWith(
          _$NetworkKeyImpl value, $Res Function(_$NetworkKeyImpl) then) =
      __$$NetworkKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int netKeyIndex,
      int phase,
      String phaseDescription,
      bool isMinSecurity,
      List<int> netKeyBytes,
      List<int>? oldNetKeyBytes,
      List<int> txNetworkKey,
      List<int> identityKey,
      List<int>? oldIdentityKey,
      String meshUuid,
      int timestamp});
}

/// @nodoc
class __$$NetworkKeyImplCopyWithImpl<$Res>
    extends _$NetworkKeyCopyWithImpl<$Res, _$NetworkKeyImpl>
    implements _$$NetworkKeyImplCopyWith<$Res> {
  __$$NetworkKeyImplCopyWithImpl(
      _$NetworkKeyImpl _value, $Res Function(_$NetworkKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? netKeyIndex = null,
    Object? phase = null,
    Object? phaseDescription = null,
    Object? isMinSecurity = null,
    Object? netKeyBytes = null,
    Object? oldNetKeyBytes = freezed,
    Object? txNetworkKey = null,
    Object? identityKey = null,
    Object? oldIdentityKey = freezed,
    Object? meshUuid = null,
    Object? timestamp = null,
  }) {
    return _then(_$NetworkKeyImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == netKeyIndex
          ? _value.netKeyIndex
          : netKeyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
      null == phaseDescription
          ? _value.phaseDescription
          : phaseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      null == isMinSecurity
          ? _value.isMinSecurity
          : isMinSecurity // ignore: cast_nullable_to_non_nullable
              as bool,
      null == netKeyBytes
          ? _value._netKeyBytes
          : netKeyBytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      freezed == oldNetKeyBytes
          ? _value._oldNetKeyBytes
          : oldNetKeyBytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      null == txNetworkKey
          ? _value._txNetworkKey
          : txNetworkKey // ignore: cast_nullable_to_non_nullable
              as List<int>,
      null == identityKey
          ? _value._identityKey
          : identityKey // ignore: cast_nullable_to_non_nullable
              as List<int>,
      freezed == oldIdentityKey
          ? _value._oldIdentityKey
          : oldIdentityKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      null == meshUuid
          ? _value.meshUuid
          : meshUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkKeyImpl implements _NetworkKey {
  const _$NetworkKeyImpl(
      this.name,
      this.netKeyIndex,
      this.phase,
      this.phaseDescription,
      this.isMinSecurity,
      final List<int> netKeyBytes,
      final List<int>? oldNetKeyBytes,
      final List<int> txNetworkKey,
      final List<int> identityKey,
      final List<int>? oldIdentityKey,
      this.meshUuid,
      this.timestamp)
      : _netKeyBytes = netKeyBytes,
        _oldNetKeyBytes = oldNetKeyBytes,
        _txNetworkKey = txNetworkKey,
        _identityKey = identityKey,
        _oldIdentityKey = oldIdentityKey;

  factory _$NetworkKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkKeyImplFromJson(json);

  @override
  final String name;
  @override
  final int netKeyIndex;
  @override
  final int phase;
  @override
  final String phaseDescription;
  @override
  final bool isMinSecurity;
  final List<int> _netKeyBytes;
  @override
  List<int> get netKeyBytes {
    if (_netKeyBytes is EqualUnmodifiableListView) return _netKeyBytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_netKeyBytes);
  }

  final List<int>? _oldNetKeyBytes;
  @override
  List<int>? get oldNetKeyBytes {
    final value = _oldNetKeyBytes;
    if (value == null) return null;
    if (_oldNetKeyBytes is EqualUnmodifiableListView) return _oldNetKeyBytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int> _txNetworkKey;
  @override
  List<int> get txNetworkKey {
    if (_txNetworkKey is EqualUnmodifiableListView) return _txNetworkKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_txNetworkKey);
  }

  final List<int> _identityKey;
  @override
  List<int> get identityKey {
    if (_identityKey is EqualUnmodifiableListView) return _identityKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_identityKey);
  }

  final List<int>? _oldIdentityKey;
  @override
  List<int>? get oldIdentityKey {
    final value = _oldIdentityKey;
    if (value == null) return null;
    if (_oldIdentityKey is EqualUnmodifiableListView) return _oldIdentityKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String meshUuid;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'NetworkKey(name: $name, netKeyIndex: $netKeyIndex, phase: $phase, phaseDescription: $phaseDescription, isMinSecurity: $isMinSecurity, netKeyBytes: $netKeyBytes, oldNetKeyBytes: $oldNetKeyBytes, txNetworkKey: $txNetworkKey, identityKey: $identityKey, oldIdentityKey: $oldIdentityKey, meshUuid: $meshUuid, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkKeyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.netKeyIndex, netKeyIndex) ||
                other.netKeyIndex == netKeyIndex) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.phaseDescription, phaseDescription) ||
                other.phaseDescription == phaseDescription) &&
            (identical(other.isMinSecurity, isMinSecurity) ||
                other.isMinSecurity == isMinSecurity) &&
            const DeepCollectionEquality()
                .equals(other._netKeyBytes, _netKeyBytes) &&
            const DeepCollectionEquality()
                .equals(other._oldNetKeyBytes, _oldNetKeyBytes) &&
            const DeepCollectionEquality()
                .equals(other._txNetworkKey, _txNetworkKey) &&
            const DeepCollectionEquality()
                .equals(other._identityKey, _identityKey) &&
            const DeepCollectionEquality()
                .equals(other._oldIdentityKey, _oldIdentityKey) &&
            (identical(other.meshUuid, meshUuid) ||
                other.meshUuid == meshUuid) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      netKeyIndex,
      phase,
      phaseDescription,
      isMinSecurity,
      const DeepCollectionEquality().hash(_netKeyBytes),
      const DeepCollectionEquality().hash(_oldNetKeyBytes),
      const DeepCollectionEquality().hash(_txNetworkKey),
      const DeepCollectionEquality().hash(_identityKey),
      const DeepCollectionEquality().hash(_oldIdentityKey),
      meshUuid,
      timestamp);

  /// Create a copy of NetworkKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkKeyImplCopyWith<_$NetworkKeyImpl> get copyWith =>
      __$$NetworkKeyImplCopyWithImpl<_$NetworkKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkKeyImplToJson(
      this,
    );
  }
}

abstract class _NetworkKey implements NetworkKey {
  const factory _NetworkKey(
      final String name,
      final int netKeyIndex,
      final int phase,
      final String phaseDescription,
      final bool isMinSecurity,
      final List<int> netKeyBytes,
      final List<int>? oldNetKeyBytes,
      final List<int> txNetworkKey,
      final List<int> identityKey,
      final List<int>? oldIdentityKey,
      final String meshUuid,
      final int timestamp) = _$NetworkKeyImpl;

  factory _NetworkKey.fromJson(Map<String, dynamic> json) =
      _$NetworkKeyImpl.fromJson;

  @override
  String get name;
  @override
  int get netKeyIndex;
  @override
  int get phase;
  @override
  String get phaseDescription;
  @override
  bool get isMinSecurity;
  @override
  List<int> get netKeyBytes;
  @override
  List<int>? get oldNetKeyBytes;
  @override
  List<int> get txNetworkKey;
  @override
  List<int> get identityKey;
  @override
  List<int>? get oldIdentityKey;
  @override
  String get meshUuid;
  @override
  int get timestamp;

  /// Create a copy of NetworkKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkKeyImplCopyWith<_$NetworkKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
