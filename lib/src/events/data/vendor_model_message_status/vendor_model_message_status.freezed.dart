// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_model_message_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VendorModelMessageStatusData _$VendorModelMessageStatusDataFromJson(
    Map<String, dynamic> json) {
  return _VendorModelMessageStatusData.fromJson(json);
}

/// @nodoc
mixin _$VendorModelMessageStatusData {
  int get source => throw _privateConstructorUsedError;
  int get modelIdentifier => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get message => throw _privateConstructorUsedError;

  /// Serializes this VendorModelMessageStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorModelMessageStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorModelMessageStatusDataCopyWith<VendorModelMessageStatusData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorModelMessageStatusDataCopyWith<$Res> {
  factory $VendorModelMessageStatusDataCopyWith(
          VendorModelMessageStatusData value,
          $Res Function(VendorModelMessageStatusData) then) =
      _$VendorModelMessageStatusDataCopyWithImpl<$Res,
          VendorModelMessageStatusData>;
  @useResult
  $Res call(
      {int source,
      int modelIdentifier,
      @Uint8ListConverter() Uint8List message});
}

/// @nodoc
class _$VendorModelMessageStatusDataCopyWithImpl<$Res,
        $Val extends VendorModelMessageStatusData>
    implements $VendorModelMessageStatusDataCopyWith<$Res> {
  _$VendorModelMessageStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorModelMessageStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? modelIdentifier = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      modelIdentifier: null == modelIdentifier
          ? _value.modelIdentifier
          : modelIdentifier // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorModelMessageStatusDataImplCopyWith<$Res>
    implements $VendorModelMessageStatusDataCopyWith<$Res> {
  factory _$$VendorModelMessageStatusDataImplCopyWith(
          _$VendorModelMessageStatusDataImpl value,
          $Res Function(_$VendorModelMessageStatusDataImpl) then) =
      __$$VendorModelMessageStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int source,
      int modelIdentifier,
      @Uint8ListConverter() Uint8List message});
}

/// @nodoc
class __$$VendorModelMessageStatusDataImplCopyWithImpl<$Res>
    extends _$VendorModelMessageStatusDataCopyWithImpl<$Res,
        _$VendorModelMessageStatusDataImpl>
    implements _$$VendorModelMessageStatusDataImplCopyWith<$Res> {
  __$$VendorModelMessageStatusDataImplCopyWithImpl(
      _$VendorModelMessageStatusDataImpl _value,
      $Res Function(_$VendorModelMessageStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorModelMessageStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? modelIdentifier = null,
    Object? message = null,
  }) {
    return _then(_$VendorModelMessageStatusDataImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == modelIdentifier
          ? _value.modelIdentifier
          : modelIdentifier // ignore: cast_nullable_to_non_nullable
              as int,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorModelMessageStatusDataImpl
    implements _VendorModelMessageStatusData {
  const _$VendorModelMessageStatusDataImpl(
      this.source, this.modelIdentifier, @Uint8ListConverter() this.message);

  factory _$VendorModelMessageStatusDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VendorModelMessageStatusDataImplFromJson(json);

  @override
  final int source;
  @override
  final int modelIdentifier;
  @override
  @Uint8ListConverter()
  final Uint8List message;

  @override
  String toString() {
    return 'VendorModelMessageStatusData(source: $source, modelIdentifier: $modelIdentifier, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorModelMessageStatusDataImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.modelIdentifier, modelIdentifier) ||
                other.modelIdentifier == modelIdentifier) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, modelIdentifier,
      const DeepCollectionEquality().hash(message));

  /// Create a copy of VendorModelMessageStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorModelMessageStatusDataImplCopyWith<
          _$VendorModelMessageStatusDataImpl>
      get copyWith => __$$VendorModelMessageStatusDataImplCopyWithImpl<
          _$VendorModelMessageStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorModelMessageStatusDataImplToJson(
      this,
    );
  }
}

abstract class _VendorModelMessageStatusData
    implements VendorModelMessageStatusData {
  const factory _VendorModelMessageStatusData(
          final int source,
          final int modelIdentifier,
          @Uint8ListConverter() final Uint8List message) =
      _$VendorModelMessageStatusDataImpl;

  factory _VendorModelMessageStatusData.fromJson(Map<String, dynamic> json) =
      _$VendorModelMessageStatusDataImpl.fromJson;

  @override
  int get source;
  @override
  int get modelIdentifier;
  @override
  @Uint8ListConverter()
  Uint8List get message;

  /// Create a copy of VendorModelMessageStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorModelMessageStatusDataImplCopyWith<
          _$VendorModelMessageStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
