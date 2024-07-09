// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genba_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenbaNameState {
  List<GenbaNameModel> get genbaNameList => throw _privateConstructorUsedError;
  Map<String, GenbaNameModel> get genbaNameMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenbaNameStateCopyWith<GenbaNameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenbaNameStateCopyWith<$Res> {
  factory $GenbaNameStateCopyWith(
          GenbaNameState value, $Res Function(GenbaNameState) then) =
      _$GenbaNameStateCopyWithImpl<$Res, GenbaNameState>;
  @useResult
  $Res call(
      {List<GenbaNameModel> genbaNameList,
      Map<String, GenbaNameModel> genbaNameMap});
}

/// @nodoc
class _$GenbaNameStateCopyWithImpl<$Res, $Val extends GenbaNameState>
    implements $GenbaNameStateCopyWith<$Res> {
  _$GenbaNameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genbaNameList = null,
    Object? genbaNameMap = null,
  }) {
    return _then(_value.copyWith(
      genbaNameList: null == genbaNameList
          ? _value.genbaNameList
          : genbaNameList // ignore: cast_nullable_to_non_nullable
              as List<GenbaNameModel>,
      genbaNameMap: null == genbaNameMap
          ? _value.genbaNameMap
          : genbaNameMap // ignore: cast_nullable_to_non_nullable
              as Map<String, GenbaNameModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenbaNameStateImplCopyWith<$Res>
    implements $GenbaNameStateCopyWith<$Res> {
  factory _$$GenbaNameStateImplCopyWith(_$GenbaNameStateImpl value,
          $Res Function(_$GenbaNameStateImpl) then) =
      __$$GenbaNameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GenbaNameModel> genbaNameList,
      Map<String, GenbaNameModel> genbaNameMap});
}

/// @nodoc
class __$$GenbaNameStateImplCopyWithImpl<$Res>
    extends _$GenbaNameStateCopyWithImpl<$Res, _$GenbaNameStateImpl>
    implements _$$GenbaNameStateImplCopyWith<$Res> {
  __$$GenbaNameStateImplCopyWithImpl(
      _$GenbaNameStateImpl _value, $Res Function(_$GenbaNameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genbaNameList = null,
    Object? genbaNameMap = null,
  }) {
    return _then(_$GenbaNameStateImpl(
      genbaNameList: null == genbaNameList
          ? _value._genbaNameList
          : genbaNameList // ignore: cast_nullable_to_non_nullable
              as List<GenbaNameModel>,
      genbaNameMap: null == genbaNameMap
          ? _value._genbaNameMap
          : genbaNameMap // ignore: cast_nullable_to_non_nullable
              as Map<String, GenbaNameModel>,
    ));
  }
}

/// @nodoc

class _$GenbaNameStateImpl implements _GenbaNameState {
  const _$GenbaNameStateImpl(
      {final List<GenbaNameModel> genbaNameList = const [],
      final Map<String, GenbaNameModel> genbaNameMap = const {}})
      : _genbaNameList = genbaNameList,
        _genbaNameMap = genbaNameMap;

  final List<GenbaNameModel> _genbaNameList;
  @override
  @JsonKey()
  List<GenbaNameModel> get genbaNameList {
    if (_genbaNameList is EqualUnmodifiableListView) return _genbaNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genbaNameList);
  }

  final Map<String, GenbaNameModel> _genbaNameMap;
  @override
  @JsonKey()
  Map<String, GenbaNameModel> get genbaNameMap {
    if (_genbaNameMap is EqualUnmodifiableMapView) return _genbaNameMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_genbaNameMap);
  }

  @override
  String toString() {
    return 'GenbaNameState(genbaNameList: $genbaNameList, genbaNameMap: $genbaNameMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenbaNameStateImpl &&
            const DeepCollectionEquality()
                .equals(other._genbaNameList, _genbaNameList) &&
            const DeepCollectionEquality()
                .equals(other._genbaNameMap, _genbaNameMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_genbaNameList),
      const DeepCollectionEquality().hash(_genbaNameMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenbaNameStateImplCopyWith<_$GenbaNameStateImpl> get copyWith =>
      __$$GenbaNameStateImplCopyWithImpl<_$GenbaNameStateImpl>(
          this, _$identity);
}

abstract class _GenbaNameState implements GenbaNameState {
  const factory _GenbaNameState(
      {final List<GenbaNameModel> genbaNameList,
      final Map<String, GenbaNameModel> genbaNameMap}) = _$GenbaNameStateImpl;

  @override
  List<GenbaNameModel> get genbaNameList;
  @override
  Map<String, GenbaNameModel> get genbaNameMap;
  @override
  @JsonKey(ignore: true)
  _$$GenbaNameStateImplCopyWith<_$GenbaNameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
