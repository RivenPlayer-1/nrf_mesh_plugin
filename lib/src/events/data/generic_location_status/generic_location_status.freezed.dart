// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_location_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenericLocationStatusData _$GenericLocationStatusDataFromJson(
    Map<String, dynamic> json) {
  return _GenericLocationStatusData.fromJson(json);
}

/// @nodoc
mixin _$GenericLocationStatusData {
  int get source => throw _privateConstructorUsedError;
  int get latitude => throw _privateConstructorUsedError;
  int get longitude => throw _privateConstructorUsedError;
  int get altitude => throw _privateConstructorUsedError;

  /// Serializes this GenericLocationStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenericLocationStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenericLocationStatusDataCopyWith<GenericLocationStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericLocationStatusDataCopyWith<$Res> {
  factory $GenericLocationStatusDataCopyWith(GenericLocationStatusData value,
          $Res Function(GenericLocationStatusData) then) =
      _$GenericLocationStatusDataCopyWithImpl<$Res, GenericLocationStatusData>;
  @useResult
  $Res call({int source, int latitude, int longitude, int altitude});
}

/// @nodoc
class _$GenericLocationStatusDataCopyWithImpl<$Res,
        $Val extends GenericLocationStatusData>
    implements $GenericLocationStatusDataCopyWith<$Res> {
  _$GenericLocationStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenericLocationStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as int,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as int,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericLocationStatusDataImplCopyWith<$Res>
    implements $GenericLocationStatusDataCopyWith<$Res> {
  factory _$$GenericLocationStatusDataImplCopyWith(
          _$GenericLocationStatusDataImpl value,
          $Res Function(_$GenericLocationStatusDataImpl) then) =
      __$$GenericLocationStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int source, int latitude, int longitude, int altitude});
}

/// @nodoc
class __$$GenericLocationStatusDataImplCopyWithImpl<$Res>
    extends _$GenericLocationStatusDataCopyWithImpl<$Res,
        _$GenericLocationStatusDataImpl>
    implements _$$GenericLocationStatusDataImplCopyWith<$Res> {
  __$$GenericLocationStatusDataImplCopyWithImpl(
      _$GenericLocationStatusDataImpl _value,
      $Res Function(_$GenericLocationStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenericLocationStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
  }) {
    return _then(_$GenericLocationStatusDataImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as int,
      null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as int,
      null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericLocationStatusDataImpl implements _GenericLocationStatusData {
  const _$GenericLocationStatusDataImpl(
      this.source, this.latitude, this.longitude, this.altitude);

  factory _$GenericLocationStatusDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericLocationStatusDataImplFromJson(json);

  @override
  final int source;
  @override
  final int latitude;
  @override
  final int longitude;
  @override
  final int altitude;

  @override
  String toString() {
    return 'GenericLocationStatusData(source: $source, latitude: $latitude, longitude: $longitude, altitude: $altitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericLocationStatusDataImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, source, latitude, longitude, altitude);

  /// Create a copy of GenericLocationStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericLocationStatusDataImplCopyWith<_$GenericLocationStatusDataImpl>
      get copyWith => __$$GenericLocationStatusDataImplCopyWithImpl<
          _$GenericLocationStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericLocationStatusDataImplToJson(
      this,
    );
  }
}

abstract class _GenericLocationStatusData implements GenericLocationStatusData {
  const factory _GenericLocationStatusData(
      final int source,
      final int latitude,
      final int longitude,
      final int altitude) = _$GenericLocationStatusDataImpl;

  factory _GenericLocationStatusData.fromJson(Map<String, dynamic> json) =
      _$GenericLocationStatusDataImpl.fromJson;

  @override
  int get source;
  @override
  int get latitude;
  @override
  int get longitude;
  @override
  int get altitude;

  /// Create a copy of GenericLocationStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenericLocationStatusDataImplCopyWith<_$GenericLocationStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
