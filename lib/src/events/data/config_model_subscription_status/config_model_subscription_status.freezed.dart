// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_model_subscription_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigModelSubscriptionStatus _$ConfigModelSubscriptionStatusFromJson(
    Map<String, dynamic> json) {
  return _ConfigModelSubscriptionStatus.fromJson(json);
}

/// @nodoc
mixin _$ConfigModelSubscriptionStatus {
  int get source => throw _privateConstructorUsedError;
  int get destination => throw _privateConstructorUsedError;
  int get elementAddress => throw _privateConstructorUsedError;
  int get subscriptionAddress => throw _privateConstructorUsedError;
  int get modelIdentifier => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;

  /// Serializes this ConfigModelSubscriptionStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigModelSubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigModelSubscriptionStatusCopyWith<ConfigModelSubscriptionStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigModelSubscriptionStatusCopyWith<$Res> {
  factory $ConfigModelSubscriptionStatusCopyWith(
          ConfigModelSubscriptionStatus value,
          $Res Function(ConfigModelSubscriptionStatus) then) =
      _$ConfigModelSubscriptionStatusCopyWithImpl<$Res,
          ConfigModelSubscriptionStatus>;
  @useResult
  $Res call(
      {int source,
      int destination,
      int elementAddress,
      int subscriptionAddress,
      int modelIdentifier,
      bool isSuccessful});
}

/// @nodoc
class _$ConfigModelSubscriptionStatusCopyWithImpl<$Res,
        $Val extends ConfigModelSubscriptionStatus>
    implements $ConfigModelSubscriptionStatusCopyWith<$Res> {
  _$ConfigModelSubscriptionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigModelSubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? elementAddress = null,
    Object? subscriptionAddress = null,
    Object? modelIdentifier = null,
    Object? isSuccessful = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
      elementAddress: null == elementAddress
          ? _value.elementAddress
          : elementAddress // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionAddress: null == subscriptionAddress
          ? _value.subscriptionAddress
          : subscriptionAddress // ignore: cast_nullable_to_non_nullable
              as int,
      modelIdentifier: null == modelIdentifier
          ? _value.modelIdentifier
          : modelIdentifier // ignore: cast_nullable_to_non_nullable
              as int,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigModelSubscriptionStatusImplCopyWith<$Res>
    implements $ConfigModelSubscriptionStatusCopyWith<$Res> {
  factory _$$ConfigModelSubscriptionStatusImplCopyWith(
          _$ConfigModelSubscriptionStatusImpl value,
          $Res Function(_$ConfigModelSubscriptionStatusImpl) then) =
      __$$ConfigModelSubscriptionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int source,
      int destination,
      int elementAddress,
      int subscriptionAddress,
      int modelIdentifier,
      bool isSuccessful});
}

/// @nodoc
class __$$ConfigModelSubscriptionStatusImplCopyWithImpl<$Res>
    extends _$ConfigModelSubscriptionStatusCopyWithImpl<$Res,
        _$ConfigModelSubscriptionStatusImpl>
    implements _$$ConfigModelSubscriptionStatusImplCopyWith<$Res> {
  __$$ConfigModelSubscriptionStatusImplCopyWithImpl(
      _$ConfigModelSubscriptionStatusImpl _value,
      $Res Function(_$ConfigModelSubscriptionStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigModelSubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? elementAddress = null,
    Object? subscriptionAddress = null,
    Object? modelIdentifier = null,
    Object? isSuccessful = null,
  }) {
    return _then(_$ConfigModelSubscriptionStatusImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as int,
      null == elementAddress
          ? _value.elementAddress
          : elementAddress // ignore: cast_nullable_to_non_nullable
              as int,
      null == subscriptionAddress
          ? _value.subscriptionAddress
          : subscriptionAddress // ignore: cast_nullable_to_non_nullable
              as int,
      null == modelIdentifier
          ? _value.modelIdentifier
          : modelIdentifier // ignore: cast_nullable_to_non_nullable
              as int,
      null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigModelSubscriptionStatusImpl
    implements _ConfigModelSubscriptionStatus {
  const _$ConfigModelSubscriptionStatusImpl(
      this.source,
      this.destination,
      this.elementAddress,
      this.subscriptionAddress,
      this.modelIdentifier,
      this.isSuccessful);

  factory _$ConfigModelSubscriptionStatusImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfigModelSubscriptionStatusImplFromJson(json);

  @override
  final int source;
  @override
  final int destination;
  @override
  final int elementAddress;
  @override
  final int subscriptionAddress;
  @override
  final int modelIdentifier;
  @override
  final bool isSuccessful;

  @override
  String toString() {
    return 'ConfigModelSubscriptionStatus(source: $source, destination: $destination, elementAddress: $elementAddress, subscriptionAddress: $subscriptionAddress, modelIdentifier: $modelIdentifier, isSuccessful: $isSuccessful)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigModelSubscriptionStatusImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.elementAddress, elementAddress) ||
                other.elementAddress == elementAddress) &&
            (identical(other.subscriptionAddress, subscriptionAddress) ||
                other.subscriptionAddress == subscriptionAddress) &&
            (identical(other.modelIdentifier, modelIdentifier) ||
                other.modelIdentifier == modelIdentifier) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, destination,
      elementAddress, subscriptionAddress, modelIdentifier, isSuccessful);

  /// Create a copy of ConfigModelSubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigModelSubscriptionStatusImplCopyWith<
          _$ConfigModelSubscriptionStatusImpl>
      get copyWith => __$$ConfigModelSubscriptionStatusImplCopyWithImpl<
          _$ConfigModelSubscriptionStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigModelSubscriptionStatusImplToJson(
      this,
    );
  }
}

abstract class _ConfigModelSubscriptionStatus
    implements ConfigModelSubscriptionStatus {
  const factory _ConfigModelSubscriptionStatus(
      final int source,
      final int destination,
      final int elementAddress,
      final int subscriptionAddress,
      final int modelIdentifier,
      final bool isSuccessful) = _$ConfigModelSubscriptionStatusImpl;

  factory _ConfigModelSubscriptionStatus.fromJson(Map<String, dynamic> json) =
      _$ConfigModelSubscriptionStatusImpl.fromJson;

  @override
  int get source;
  @override
  int get destination;
  @override
  int get elementAddress;
  @override
  int get subscriptionAddress;
  @override
  int get modelIdentifier;
  @override
  bool get isSuccessful;

  /// Create a copy of ConfigModelSubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigModelSubscriptionStatusImplCopyWith<
          _$ConfigModelSubscriptionStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
