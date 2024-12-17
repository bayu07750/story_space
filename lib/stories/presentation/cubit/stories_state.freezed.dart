// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<Story> get stories => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoriesStateCopyWith<StoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesStateCopyWith<$Res> {
  factory $StoriesStateCopyWith(
          StoriesState value, $Res Function(StoriesState) then) =
      _$StoriesStateCopyWithImpl<$Res, StoriesState>;
  @useResult
  $Res call(
      {bool isLoading, bool isError, List<Story> stories, String? message});
}

/// @nodoc
class _$StoriesStateCopyWithImpl<$Res, $Val extends StoriesState>
    implements $StoriesStateCopyWith<$Res> {
  _$StoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? stories = null,
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
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoriesStateImplCopyWith<$Res>
    implements $StoriesStateCopyWith<$Res> {
  factory _$$StoriesStateImplCopyWith(
          _$StoriesStateImpl value, $Res Function(_$StoriesStateImpl) then) =
      __$$StoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isError, List<Story> stories, String? message});
}

/// @nodoc
class __$$StoriesStateImplCopyWithImpl<$Res>
    extends _$StoriesStateCopyWithImpl<$Res, _$StoriesStateImpl>
    implements _$$StoriesStateImplCopyWith<$Res> {
  __$$StoriesStateImplCopyWithImpl(
      _$StoriesStateImpl _value, $Res Function(_$StoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? stories = null,
    Object? message = freezed,
  }) {
    return _then(_$StoriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StoriesStateImpl implements _StoriesState {
  const _$StoriesStateImpl(
      {required this.isLoading,
      required this.isError,
      required final List<Story> stories,
      this.message})
      : _stories = stories;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<Story> _stories;
  @override
  List<Story> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'StoriesState(isLoading: $isLoading, isError: $isError, stories: $stories, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality().equals(other._stories, _stories) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      const DeepCollectionEquality().hash(_stories), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesStateImplCopyWith<_$StoriesStateImpl> get copyWith =>
      __$$StoriesStateImplCopyWithImpl<_$StoriesStateImpl>(this, _$identity);
}

abstract class _StoriesState implements StoriesState {
  const factory _StoriesState(
      {required final bool isLoading,
      required final bool isError,
      required final List<Story> stories,
      final String? message}) = _$StoriesStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<Story> get stories;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$StoriesStateImplCopyWith<_$StoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
