// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LogoutState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogoutStateCopyWith<LogoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutStateCopyWith<$Res> {
  factory $LogoutStateCopyWith(
          LogoutState value, $Res Function(LogoutState) then) =
      _$LogoutStateCopyWithImpl<$Res, LogoutState>;
  @useResult
  $Res call({bool isLoading, bool isError, bool isSuccess});
}

/// @nodoc
class _$LogoutStateCopyWithImpl<$Res, $Val extends LogoutState>
    implements $LogoutStateCopyWith<$Res> {
  _$LogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogoutStateImplCopyWith<$Res>
    implements $LogoutStateCopyWith<$Res> {
  factory _$$LogoutStateImplCopyWith(
          _$LogoutStateImpl value, $Res Function(_$LogoutStateImpl) then) =
      __$$LogoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError, bool isSuccess});
}

/// @nodoc
class __$$LogoutStateImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutStateImpl>
    implements _$$LogoutStateImplCopyWith<$Res> {
  __$$LogoutStateImplCopyWithImpl(
      _$LogoutStateImpl _value, $Res Function(_$LogoutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
  }) {
    return _then(_$LogoutStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LogoutStateImpl implements _LogoutState {
  const _$LogoutStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.isSuccess});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool isSuccess;

  @override
  String toString() {
    return 'LogoutState(isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutStateImplCopyWith<_$LogoutStateImpl> get copyWith =>
      __$$LogoutStateImplCopyWithImpl<_$LogoutStateImpl>(this, _$identity);
}

abstract class _LogoutState implements LogoutState {
  const factory _LogoutState(
      {required final bool isLoading,
      required final bool isError,
      required final bool isSuccess}) = _$LogoutStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$LogoutStateImplCopyWith<_$LogoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
