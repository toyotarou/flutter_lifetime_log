// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worktime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorktimeState {
  List<WorkTimeModel> get worktimeList => throw _privateConstructorUsedError;
  Map<String, WorkTimeModel> get worktimeMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorktimeStateCopyWith<WorktimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorktimeStateCopyWith<$Res> {
  factory $WorktimeStateCopyWith(
          WorktimeState value, $Res Function(WorktimeState) then) =
      _$WorktimeStateCopyWithImpl<$Res, WorktimeState>;
  @useResult
  $Res call(
      {List<WorkTimeModel> worktimeList,
      Map<String, WorkTimeModel> worktimeMap});
}

/// @nodoc
class _$WorktimeStateCopyWithImpl<$Res, $Val extends WorktimeState>
    implements $WorktimeStateCopyWith<$Res> {
  _$WorktimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? worktimeList = null,
    Object? worktimeMap = null,
  }) {
    return _then(_value.copyWith(
      worktimeList: null == worktimeList
          ? _value.worktimeList
          : worktimeList // ignore: cast_nullable_to_non_nullable
              as List<WorkTimeModel>,
      worktimeMap: null == worktimeMap
          ? _value.worktimeMap
          : worktimeMap // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkTimeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorktimeStateImplCopyWith<$Res>
    implements $WorktimeStateCopyWith<$Res> {
  factory _$$WorktimeStateImplCopyWith(
          _$WorktimeStateImpl value, $Res Function(_$WorktimeStateImpl) then) =
      __$$WorktimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WorkTimeModel> worktimeList,
      Map<String, WorkTimeModel> worktimeMap});
}

/// @nodoc
class __$$WorktimeStateImplCopyWithImpl<$Res>
    extends _$WorktimeStateCopyWithImpl<$Res, _$WorktimeStateImpl>
    implements _$$WorktimeStateImplCopyWith<$Res> {
  __$$WorktimeStateImplCopyWithImpl(
      _$WorktimeStateImpl _value, $Res Function(_$WorktimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? worktimeList = null,
    Object? worktimeMap = null,
  }) {
    return _then(_$WorktimeStateImpl(
      worktimeList: null == worktimeList
          ? _value._worktimeList
          : worktimeList // ignore: cast_nullable_to_non_nullable
              as List<WorkTimeModel>,
      worktimeMap: null == worktimeMap
          ? _value._worktimeMap
          : worktimeMap // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkTimeModel>,
    ));
  }
}

/// @nodoc

class _$WorktimeStateImpl implements _WorktimeState {
  const _$WorktimeStateImpl(
      {final List<WorkTimeModel> worktimeList = const [],
      final Map<String, WorkTimeModel> worktimeMap = const {}})
      : _worktimeList = worktimeList,
        _worktimeMap = worktimeMap;

  final List<WorkTimeModel> _worktimeList;
  @override
  @JsonKey()
  List<WorkTimeModel> get worktimeList {
    if (_worktimeList is EqualUnmodifiableListView) return _worktimeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_worktimeList);
  }

  final Map<String, WorkTimeModel> _worktimeMap;
  @override
  @JsonKey()
  Map<String, WorkTimeModel> get worktimeMap {
    if (_worktimeMap is EqualUnmodifiableMapView) return _worktimeMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_worktimeMap);
  }

  @override
  String toString() {
    return 'WorktimeState(worktimeList: $worktimeList, worktimeMap: $worktimeMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorktimeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._worktimeList, _worktimeList) &&
            const DeepCollectionEquality()
                .equals(other._worktimeMap, _worktimeMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_worktimeList),
      const DeepCollectionEquality().hash(_worktimeMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorktimeStateImplCopyWith<_$WorktimeStateImpl> get copyWith =>
      __$$WorktimeStateImplCopyWithImpl<_$WorktimeStateImpl>(this, _$identity);
}

abstract class _WorktimeState implements WorktimeState {
  const factory _WorktimeState(
      {final List<WorkTimeModel> worktimeList,
      final Map<String, WorkTimeModel> worktimeMap}) = _$WorktimeStateImpl;

  @override
  List<WorkTimeModel> get worktimeList;
  @override
  Map<String, WorkTimeModel> get worktimeMap;
  @override
  @JsonKey(ignore: true)
  _$$WorktimeStateImplCopyWith<_$WorktimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
