// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spend_time_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpendTimePlaceState {
  List<SpendTimePlaceModel> get spendTimePlaceList =>
      throw _privateConstructorUsedError;
  Map<String, List<SpendTimePlaceModel>> get spendTimePlaceMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpendTimePlaceStateCopyWith<SpendTimePlaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendTimePlaceStateCopyWith<$Res> {
  factory $SpendTimePlaceStateCopyWith(
          SpendTimePlaceState value, $Res Function(SpendTimePlaceState) then) =
      _$SpendTimePlaceStateCopyWithImpl<$Res, SpendTimePlaceState>;
  @useResult
  $Res call(
      {List<SpendTimePlaceModel> spendTimePlaceList,
      Map<String, List<SpendTimePlaceModel>> spendTimePlaceMap});
}

/// @nodoc
class _$SpendTimePlaceStateCopyWithImpl<$Res, $Val extends SpendTimePlaceState>
    implements $SpendTimePlaceStateCopyWith<$Res> {
  _$SpendTimePlaceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendTimePlaceList = null,
    Object? spendTimePlaceMap = null,
  }) {
    return _then(_value.copyWith(
      spendTimePlaceList: null == spendTimePlaceList
          ? _value.spendTimePlaceList
          : spendTimePlaceList // ignore: cast_nullable_to_non_nullable
              as List<SpendTimePlaceModel>,
      spendTimePlaceMap: null == spendTimePlaceMap
          ? _value.spendTimePlaceMap
          : spendTimePlaceMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SpendTimePlaceModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendTimePlaceStateImplCopyWith<$Res>
    implements $SpendTimePlaceStateCopyWith<$Res> {
  factory _$$SpendTimePlaceStateImplCopyWith(_$SpendTimePlaceStateImpl value,
          $Res Function(_$SpendTimePlaceStateImpl) then) =
      __$$SpendTimePlaceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SpendTimePlaceModel> spendTimePlaceList,
      Map<String, List<SpendTimePlaceModel>> spendTimePlaceMap});
}

/// @nodoc
class __$$SpendTimePlaceStateImplCopyWithImpl<$Res>
    extends _$SpendTimePlaceStateCopyWithImpl<$Res, _$SpendTimePlaceStateImpl>
    implements _$$SpendTimePlaceStateImplCopyWith<$Res> {
  __$$SpendTimePlaceStateImplCopyWithImpl(_$SpendTimePlaceStateImpl _value,
      $Res Function(_$SpendTimePlaceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendTimePlaceList = null,
    Object? spendTimePlaceMap = null,
  }) {
    return _then(_$SpendTimePlaceStateImpl(
      spendTimePlaceList: null == spendTimePlaceList
          ? _value._spendTimePlaceList
          : spendTimePlaceList // ignore: cast_nullable_to_non_nullable
              as List<SpendTimePlaceModel>,
      spendTimePlaceMap: null == spendTimePlaceMap
          ? _value._spendTimePlaceMap
          : spendTimePlaceMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SpendTimePlaceModel>>,
    ));
  }
}

/// @nodoc

class _$SpendTimePlaceStateImpl implements _SpendTimePlaceState {
  const _$SpendTimePlaceStateImpl(
      {final List<SpendTimePlaceModel> spendTimePlaceList = const [],
      final Map<String, List<SpendTimePlaceModel>> spendTimePlaceMap =
          const {}})
      : _spendTimePlaceList = spendTimePlaceList,
        _spendTimePlaceMap = spendTimePlaceMap;

  final List<SpendTimePlaceModel> _spendTimePlaceList;
  @override
  @JsonKey()
  List<SpendTimePlaceModel> get spendTimePlaceList {
    if (_spendTimePlaceList is EqualUnmodifiableListView)
      return _spendTimePlaceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendTimePlaceList);
  }

  final Map<String, List<SpendTimePlaceModel>> _spendTimePlaceMap;
  @override
  @JsonKey()
  Map<String, List<SpendTimePlaceModel>> get spendTimePlaceMap {
    if (_spendTimePlaceMap is EqualUnmodifiableMapView)
      return _spendTimePlaceMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_spendTimePlaceMap);
  }

  @override
  String toString() {
    return 'SpendTimePlaceState(spendTimePlaceList: $spendTimePlaceList, spendTimePlaceMap: $spendTimePlaceMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendTimePlaceStateImpl &&
            const DeepCollectionEquality()
                .equals(other._spendTimePlaceList, _spendTimePlaceList) &&
            const DeepCollectionEquality()
                .equals(other._spendTimePlaceMap, _spendTimePlaceMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_spendTimePlaceList),
      const DeepCollectionEquality().hash(_spendTimePlaceMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendTimePlaceStateImplCopyWith<_$SpendTimePlaceStateImpl> get copyWith =>
      __$$SpendTimePlaceStateImplCopyWithImpl<_$SpendTimePlaceStateImpl>(
          this, _$identity);
}

abstract class _SpendTimePlaceState implements SpendTimePlaceState {
  const factory _SpendTimePlaceState(
          {final List<SpendTimePlaceModel> spendTimePlaceList,
          final Map<String, List<SpendTimePlaceModel>> spendTimePlaceMap}) =
      _$SpendTimePlaceStateImpl;

  @override
  List<SpendTimePlaceModel> get spendTimePlaceList;
  @override
  Map<String, List<SpendTimePlaceModel>> get spendTimePlaceMap;
  @override
  @JsonKey(ignore: true)
  _$$SpendTimePlaceStateImplCopyWith<_$SpendTimePlaceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
