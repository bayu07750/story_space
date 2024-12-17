// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_location_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PickLocationResult {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PickLocationResultCopyWith<PickLocationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickLocationResultCopyWith<$Res> {
  factory $PickLocationResultCopyWith(
          PickLocationResult value, $Res Function(PickLocationResult) then) =
      _$PickLocationResultCopyWithImpl<$Res, PickLocationResult>;
  @useResult
  $Res call({double latitude, double longitude, String street, String address});
}

/// @nodoc
class _$PickLocationResultCopyWithImpl<$Res, $Val extends PickLocationResult>
    implements $PickLocationResultCopyWith<$Res> {
  _$PickLocationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? street = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickLocationResultImplCopyWith<$Res>
    implements $PickLocationResultCopyWith<$Res> {
  factory _$$PickLocationResultImplCopyWith(_$PickLocationResultImpl value,
          $Res Function(_$PickLocationResultImpl) then) =
      __$$PickLocationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, String street, String address});
}

/// @nodoc
class __$$PickLocationResultImplCopyWithImpl<$Res>
    extends _$PickLocationResultCopyWithImpl<$Res, _$PickLocationResultImpl>
    implements _$$PickLocationResultImplCopyWith<$Res> {
  __$$PickLocationResultImplCopyWithImpl(_$PickLocationResultImpl _value,
      $Res Function(_$PickLocationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? street = null,
    Object? address = null,
  }) {
    return _then(_$PickLocationResultImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PickLocationResultImpl implements _PickLocationResult {
  const _$PickLocationResultImpl(
      {required this.latitude,
      required this.longitude,
      required this.street,
      required this.address});

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String street;
  @override
  final String address;

  @override
  String toString() {
    return 'PickLocationResult(latitude: $latitude, longitude: $longitude, street: $street, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickLocationResultImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, street, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickLocationResultImplCopyWith<_$PickLocationResultImpl> get copyWith =>
      __$$PickLocationResultImplCopyWithImpl<_$PickLocationResultImpl>(
          this, _$identity);
}

abstract class _PickLocationResult implements PickLocationResult {
  const factory _PickLocationResult(
      {required final double latitude,
      required final double longitude,
      required final String street,
      required final String address}) = _$PickLocationResultImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get street;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$PickLocationResultImplCopyWith<_$PickLocationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
