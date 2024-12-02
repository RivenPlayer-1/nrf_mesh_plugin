// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allocated_group_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllocatedGroupRange _$AllocatedGroupRangeFromJson(Map<String, dynamic> json) {
  return _AllocatedGroupRange.fromJson(json);
}

/// @nodoc
mixin _$AllocatedGroupRange {
  int get lowAddress => throw _privateConstructorUsedError;
  int get highAddress => throw _privateConstructorUsedError;

  /// Serializes this AllocatedGroupRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllocatedGroupRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllocatedGroupRangeCopyWith<AllocatedGroupRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllocatedGroupRangeCopyWith<$Res> {
  factory $AllocatedGroupRangeCopyWith(
          AllocatedGroupRange value, $Res Function(AllocatedGroupRange) then) =
      _$AllocatedGroupRangeCopyWithImpl<$Res, AllocatedGroupRange>;
  @useResult
  $Res call({int lowAddress, int highAddress});
}

/// @nodoc
class _$AllocatedGroupRangeCopyWithImpl<$Res, $Val extends AllocatedGroupRange>
    implements $AllocatedGroupRangeCopyWith<$Res> {
  _$AllocatedGroupRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllocatedGroupRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lowAddress = null,
    Object? highAddress = null,
  }) {
    return _then(_value.copyWith(
      lowAddress: null == lowAddress
          ? _value.lowAddress
          : lowAddress // ignore: cast_nullable_to_non_nullable
              as int,
      highAddress: null == highAddress
          ? _value.highAddress
          : highAddress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllocatedGroupRangeImplCopyWith<$Res>
    implements $AllocatedGroupRangeCopyWith<$Res> {
  factory _$$AllocatedGroupRangeImplCopyWith(_$AllocatedGroupRangeImpl value,
          $Res Function(_$AllocatedGroupRangeImpl) then) =
      __$$AllocatedGroupRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int lowAddress, int highAddress});
}

/// @nodoc
class __$$AllocatedGroupRangeImplCopyWithImpl<$Res>
    extends _$AllocatedGroupRangeCopyWithImpl<$Res, _$AllocatedGroupRangeImpl>
    implements _$$AllocatedGroupRangeImplCopyWith<$Res> {
  __$$AllocatedGroupRangeImplCopyWithImpl(_$AllocatedGroupRangeImpl _value,
      $Res Function(_$AllocatedGroupRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllocatedGroupRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lowAddress = null,
    Object? highAddress = null,
  }) {
    return _then(_$AllocatedGroupRangeImpl(
      null == lowAddress
          ? _value.lowAddress
          : lowAddress // ignore: cast_nullable_to_non_nullable
              as int,
      null == highAddress
          ? _value.highAddress
          : highAddress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllocatedGroupRangeImpl implements _AllocatedGroupRange {
  const _$AllocatedGroupRangeImpl(this.lowAddress, this.highAddress);

  factory _$AllocatedGroupRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllocatedGroupRangeImplFromJson(json);

  @override
  final int lowAddress;
  @override
  final int highAddress;

  @override
  String toString() {
    return 'AllocatedGroupRange(lowAddress: $lowAddress, highAddress: $highAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllocatedGroupRangeImpl &&
            (identical(other.lowAddress, lowAddress) ||
                other.lowAddress == lowAddress) &&
            (identical(other.highAddress, highAddress) ||
                other.highAddress == highAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lowAddress, highAddress);

  /// Create a copy of AllocatedGroupRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllocatedGroupRangeImplCopyWith<_$AllocatedGroupRangeImpl> get copyWith =>
      __$$AllocatedGroupRangeImplCopyWithImpl<_$AllocatedGroupRangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllocatedGroupRangeImplToJson(
      this,
    );
  }
}

abstract class _AllocatedGroupRange implements AllocatedGroupRange {
  const factory _AllocatedGroupRange(
      final int lowAddress, final int highAddress) = _$AllocatedGroupRangeImpl;

  factory _AllocatedGroupRange.fromJson(Map<String, dynamic> json) =
      _$AllocatedGroupRangeImpl.fromJson;

  @override
  int get lowAddress;
  @override
  int get highAddress;

  /// Create a copy of AllocatedGroupRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllocatedGroupRangeImplCopyWith<_$AllocatedGroupRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
