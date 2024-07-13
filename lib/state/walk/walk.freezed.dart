// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalkState {
  WalkModel? get walk => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalkStateCopyWith<WalkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkStateCopyWith<$Res> {
  factory $WalkStateCopyWith(WalkState value, $Res Function(WalkState) then) =
      _$WalkStateCopyWithImpl<$Res, WalkState>;
  @useResult
  $Res call({WalkModel? walk});
}

/// @nodoc
class _$WalkStateCopyWithImpl<$Res, $Val extends WalkState>
    implements $WalkStateCopyWith<$Res> {
  _$WalkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walk = freezed,
  }) {
    return _then(_value.copyWith(
      walk: freezed == walk
          ? _value.walk
          : walk // ignore: cast_nullable_to_non_nullable
              as WalkModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalkStateImplCopyWith<$Res>
    implements $WalkStateCopyWith<$Res> {
  factory _$$WalkStateImplCopyWith(
          _$WalkStateImpl value, $Res Function(_$WalkStateImpl) then) =
      __$$WalkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WalkModel? walk});
}

/// @nodoc
class __$$WalkStateImplCopyWithImpl<$Res>
    extends _$WalkStateCopyWithImpl<$Res, _$WalkStateImpl>
    implements _$$WalkStateImplCopyWith<$Res> {
  __$$WalkStateImplCopyWithImpl(
      _$WalkStateImpl _value, $Res Function(_$WalkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walk = freezed,
  }) {
    return _then(_$WalkStateImpl(
      walk: freezed == walk
          ? _value.walk
          : walk // ignore: cast_nullable_to_non_nullable
              as WalkModel?,
    ));
  }
}

/// @nodoc

class _$WalkStateImpl implements _WalkState {
  const _$WalkStateImpl({this.walk});

  @override
  final WalkModel? walk;

  @override
  String toString() {
    return 'WalkState(walk: $walk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalkStateImpl &&
            (identical(other.walk, walk) || other.walk == walk));
  }

  @override
  int get hashCode => Object.hash(runtimeType, walk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkStateImplCopyWith<_$WalkStateImpl> get copyWith =>
      __$$WalkStateImplCopyWithImpl<_$WalkStateImpl>(this, _$identity);
}

abstract class _WalkState implements WalkState {
  const factory _WalkState({final WalkModel? walk}) = _$WalkStateImpl;

  @override
  WalkModel? get walk;
  @override
  @JsonKey(ignore: true)
  _$$WalkStateImplCopyWith<_$WalkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
