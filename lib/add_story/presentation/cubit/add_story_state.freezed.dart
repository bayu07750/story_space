// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddStoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddStoryStateCopyWith<AddStoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryStateCopyWith<$Res> {
  factory $AddStoryStateCopyWith(
          AddStoryState value, $Res Function(AddStoryState) then) =
      _$AddStoryStateCopyWithImpl<$Res, AddStoryState>;
  @useResult
  $Res call({bool isLoading, bool isError, bool isSuccess, String? message});
}

/// @nodoc
class _$AddStoryStateCopyWithImpl<$Res, $Val extends AddStoryState>
    implements $AddStoryStateCopyWith<$Res> {
  _$AddStoryStateCopyWithImpl(this._value, this._then);

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
    Object? message = freezed,
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryStateImplCopyWith<$Res>
    implements $AddStoryStateCopyWith<$Res> {
  factory _$$AddStoryStateImplCopyWith(
          _$AddStoryStateImpl value, $Res Function(_$AddStoryStateImpl) then) =
      __$$AddStoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError, bool isSuccess, String? message});
}

/// @nodoc
class __$$AddStoryStateImplCopyWithImpl<$Res>
    extends _$AddStoryStateCopyWithImpl<$Res, _$AddStoryStateImpl>
    implements _$$AddStoryStateImplCopyWith<$Res> {
  __$$AddStoryStateImplCopyWithImpl(
      _$AddStoryStateImpl _value, $Res Function(_$AddStoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? message = freezed,
  }) {
    return _then(_$AddStoryStateImpl(
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddStoryStateImpl implements _AddStoryState {
  const _$AddStoryStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.isSuccess,
      this.message});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool isSuccess;
  @override
  final String? message;

  @override
  String toString() {
    return 'AddStoryState(isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isError, isSuccess, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryStateImplCopyWith<_$AddStoryStateImpl> get copyWith =>
      __$$AddStoryStateImplCopyWithImpl<_$AddStoryStateImpl>(this, _$identity);
}

abstract class _AddStoryState implements AddStoryState {
  const factory _AddStoryState(
      {required final bool isLoading,
      required final bool isError,
      required final bool isSuccess,
      final String? message}) = _$AddStoryStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isSuccess;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryStateImplCopyWith<_$AddStoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
