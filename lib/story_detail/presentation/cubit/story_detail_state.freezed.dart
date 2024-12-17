// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Story? get story => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryDetailStateCopyWith<StoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryDetailStateCopyWith<$Res> {
  factory $StoryDetailStateCopyWith(
          StoryDetailState value, $Res Function(StoryDetailState) then) =
      _$StoryDetailStateCopyWithImpl<$Res, StoryDetailState>;
  @useResult
  $Res call({bool isLoading, bool isError, String? message, Story? story});

  $StoryCopyWith<$Res>? get story;
}

/// @nodoc
class _$StoryDetailStateCopyWithImpl<$Res, $Val extends StoryDetailState>
    implements $StoryDetailStateCopyWith<$Res> {
  _$StoryDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? message = freezed,
    Object? story = freezed,
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryCopyWith<$Res>? get story {
    if (_value.story == null) {
      return null;
    }

    return $StoryCopyWith<$Res>(_value.story!, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryDetailStateImplCopyWith<$Res>
    implements $StoryDetailStateCopyWith<$Res> {
  factory _$$StoryDetailStateImplCopyWith(_$StoryDetailStateImpl value,
          $Res Function(_$StoryDetailStateImpl) then) =
      __$$StoryDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError, String? message, Story? story});

  @override
  $StoryCopyWith<$Res>? get story;
}

/// @nodoc
class __$$StoryDetailStateImplCopyWithImpl<$Res>
    extends _$StoryDetailStateCopyWithImpl<$Res, _$StoryDetailStateImpl>
    implements _$$StoryDetailStateImplCopyWith<$Res> {
  __$$StoryDetailStateImplCopyWithImpl(_$StoryDetailStateImpl _value,
      $Res Function(_$StoryDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? message = freezed,
    Object? story = freezed,
  }) {
    return _then(_$StoryDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story?,
    ));
  }
}

/// @nodoc

class _$StoryDetailStateImpl implements _StoryDetailState {
  const _$StoryDetailStateImpl(
      {required this.isLoading,
      required this.isError,
      this.message,
      this.story});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String? message;
  @override
  final Story? story;

  @override
  String toString() {
    return 'StoryDetailState(isLoading: $isLoading, isError: $isError, message: $message, story: $story)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.story, story) || other.story == story));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isError, message, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryDetailStateImplCopyWith<_$StoryDetailStateImpl> get copyWith =>
      __$$StoryDetailStateImplCopyWithImpl<_$StoryDetailStateImpl>(
          this, _$identity);
}

abstract class _StoryDetailState implements StoryDetailState {
  const factory _StoryDetailState(
      {required final bool isLoading,
      required final bool isError,
      final String? message,
      final Story? story}) = _$StoryDetailStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String? get message;
  @override
  Story? get story;
  @override
  @JsonKey(ignore: true)
  _$$StoryDetailStateImplCopyWith<_$StoryDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
