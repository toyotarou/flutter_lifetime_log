// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpendState {
  List<Map<String, dynamic>> get spendList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpendStateCopyWith<SpendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendStateCopyWith<$Res> {
  factory $SpendStateCopyWith(
          SpendState value, $Res Function(SpendState) then) =
      _$SpendStateCopyWithImpl<$Res, SpendState>;
  @useResult
  $Res call({List<Map<String, dynamic>> spendList});
}

/// @nodoc
class _$SpendStateCopyWithImpl<$Res, $Val extends SpendState>
    implements $SpendStateCopyWith<$Res> {
  _$SpendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendList = null,
  }) {
    return _then(_value.copyWith(
      spendList: null == spendList
          ? _value.spendList
          : spendList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendStateImplCopyWith<$Res>
    implements $SpendStateCopyWith<$Res> {
  factory _$$SpendStateImplCopyWith(
          _$SpendStateImpl value, $Res Function(_$SpendStateImpl) then) =
      __$$SpendStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> spendList});
}

/// @nodoc
class __$$SpendStateImplCopyWithImpl<$Res>
    extends _$SpendStateCopyWithImpl<$Res, _$SpendStateImpl>
    implements _$$SpendStateImplCopyWith<$Res> {
  __$$SpendStateImplCopyWithImpl(
      _$SpendStateImpl _value, $Res Function(_$SpendStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendList = null,
  }) {
    return _then(_$SpendStateImpl(
      spendList: null == spendList
          ? _value._spendList
          : spendList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$SpendStateImpl implements _SpendState {
  const _$SpendStateImpl(
      {final List<Map<String, dynamic>> spendList = const []})
      : _spendList = spendList;

  final List<Map<String, dynamic>> _spendList;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get spendList {
    if (_spendList is EqualUnmodifiableListView) return _spendList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendList);
  }

  @override
  String toString() {
    return 'SpendState(spendList: $spendList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendStateImpl &&
            const DeepCollectionEquality()
                .equals(other._spendList, _spendList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_spendList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendStateImplCopyWith<_$SpendStateImpl> get copyWith =>
      __$$SpendStateImplCopyWithImpl<_$SpendStateImpl>(this, _$identity);
}

abstract class _SpendState implements SpendState {
  const factory _SpendState({final List<Map<String, dynamic>> spendList}) =
      _$SpendStateImpl;

  @override
  List<Map<String, dynamic>> get spendList;
  @override
  @JsonKey(ignore: true)
  _$$SpendStateImplCopyWith<_$SpendStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
