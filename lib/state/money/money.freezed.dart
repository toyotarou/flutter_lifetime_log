// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoneyState {
  MoneyModel? get money => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoneyStateCopyWith<MoneyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyStateCopyWith<$Res> {
  factory $MoneyStateCopyWith(
          MoneyState value, $Res Function(MoneyState) then) =
      _$MoneyStateCopyWithImpl<$Res, MoneyState>;
  @useResult
  $Res call({MoneyModel? money});
}

/// @nodoc
class _$MoneyStateCopyWithImpl<$Res, $Val extends MoneyState>
    implements $MoneyStateCopyWith<$Res> {
  _$MoneyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? money = freezed,
  }) {
    return _then(_value.copyWith(
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as MoneyModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoneyStateImplCopyWith<$Res>
    implements $MoneyStateCopyWith<$Res> {
  factory _$$MoneyStateImplCopyWith(
          _$MoneyStateImpl value, $Res Function(_$MoneyStateImpl) then) =
      __$$MoneyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MoneyModel? money});
}

/// @nodoc
class __$$MoneyStateImplCopyWithImpl<$Res>
    extends _$MoneyStateCopyWithImpl<$Res, _$MoneyStateImpl>
    implements _$$MoneyStateImplCopyWith<$Res> {
  __$$MoneyStateImplCopyWithImpl(
      _$MoneyStateImpl _value, $Res Function(_$MoneyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? money = freezed,
  }) {
    return _then(_$MoneyStateImpl(
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as MoneyModel?,
    ));
  }
}

/// @nodoc

class _$MoneyStateImpl implements _MoneyState {
  const _$MoneyStateImpl({this.money});

  @override
  final MoneyModel? money;

  @override
  String toString() {
    return 'MoneyState(money: $money)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoneyStateImpl &&
            (identical(other.money, money) || other.money == money));
  }

  @override
  int get hashCode => Object.hash(runtimeType, money);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoneyStateImplCopyWith<_$MoneyStateImpl> get copyWith =>
      __$$MoneyStateImplCopyWithImpl<_$MoneyStateImpl>(this, _$identity);
}

abstract class _MoneyState implements MoneyState {
  const factory _MoneyState({final MoneyModel? money}) = _$MoneyStateImpl;

  @override
  MoneyModel? get money;
  @override
  @JsonKey(ignore: true)
  _$$MoneyStateImplCopyWith<_$MoneyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
