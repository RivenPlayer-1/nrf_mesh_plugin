// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allocated_unicast_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllocatedUnicastRange _$AllocatedUnicastRangeFromJson(
    Map<String, dynamic> json) {
  return _AllocatedUnicastRange.fromJson(json);
}

/// @nodoc
mixin _$AllocatedUnicastRange {
  int get lowAddress => throw _privateConstructorUsedError;
  int get highAddress => throw _privateConstructorUsedError;

  /// Serializes this AllocatedUnicastRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllocatedUnicastRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllocatedUnicastRangeCopyWith<AllocatedUnicastRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllocatedUnicastRangeCopyWith<$Res> {
  factory $AllocatedUnicastRangeCopyWith(AllocatedUnicastRange value,
          $Res Function(AllocatedUnicastRange) then) =
      _$AllocatedUnicastRangeCopyWithImpl<$Res, AllocatedUnicastRange>;
  @useResult
  $Res call({int lowAddress, int highAddress});
}

/// @nodoc
class _$AllocatedUnicastRangeCopyWithImpl<$Res,
        $Val extends AllocatedUnicastRange>
    implements $AllocatedUnicastRangeCopyWith<$Res> {
  _$AllocatedUnicastRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllocatedUnicastRange
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
abstract class _$$AllocatedUnicastRangeImplCopyWith<$Res>
    implements $AllocatedUnicastRangeCopyWith<$Res> {
  factory _$$AllocatedUnicastRangeImplCopyWith(
          _$AllocatedUnicastRangeImpl value,
          $Res Function(_$AllocatedUnicastRangeImpl) then) =
      __$$AllocatedUnicastRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int lowAddress, int highAddress});
}

/// @nodoc
class __$$AllocatedUnicastRangeImplCopyWithImpl<$Res>
    extends _$AllocatedUnicastRangeCopyWithImpl<$Res,
        _$AllocatedUnicastRangeImpl>
    implements _$$AllocatedUnicastRangeImplCopyWith<$Res> {
  __$$AllocatedUnicastRangeImplCopyWithImpl(_$AllocatedUnicastRangeImpl _value,
      $Res Function(_$AllocatedUnicastRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllocatedUnicastRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lowAddress = null,
    Object? highAddress = null,
  }) {
    return _then(_$AllocatedUnicastRangeImpl(
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
class _$AllocatedUnicastRangeImpl implements _AllocatedUnicastRange {
  const _$AllocatedUnicastRangeImpl(this.lowAddress, this.highAddress);

  factory _$AllocatedUnicastRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllocatedUnicastRangeImplFromJson(json);

  @override
  final int lowAddress;
  @override
  final int highAddress;

  @override
  String toString() {
    return 'AllocatedUnicastRange(lowAddress: $lowAddress, highAddress: $highAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllocatedUnicastRangeImpl &&
            (identical(other.lowAddress, lowAddress) ||
                other.lowAddress == lowAddress) &&
            (identical(other.highAddress, highAddress) ||
                other.highAddress == highAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lowAddress, highAddress);

  /// Create a copy of AllocatedUnicastRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllocatedUnicastRangeImplCopyWith<_$AllocatedUnicastRangeImpl>
      get copyWith => __$$AllocatedUnicastRangeImplCopyWithImpl<
          _$AllocatedUnicastRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllocatedUnicastRangeImplToJson(
      this,
    );
  }
}

abstract class _AllocatedUnicastRange implements AllocatedUnicastRange {
  const factory _AllocatedUnicastRange(
          final int lowAddress, final int highAddress) =
      _$AllocatedUnicastRangeImpl;

  factory _AllocatedUnicastRange.fromJson(Map<String, dynamic> json) =
      _$AllocatedUnicastRangeImpl.fromJson;

  @override
  int get lowAddress;
  @override
  int get highAddress;

  /// Create a copy of AllocatedUnicastRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllocatedUnicastRangeImplCopyWith<_$AllocatedUnicastRangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
