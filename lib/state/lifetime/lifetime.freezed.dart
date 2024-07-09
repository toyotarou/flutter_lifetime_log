// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lifetime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LifetimeState {
  LifetimeModel? get lifetime => throw _privateConstructorUsedError;
  List<LifetimeModel> get lifetimeList => throw _privateConstructorUsedError;
  Map<String, LifetimeModel> get lifetimeMap =>
      throw _privateConstructorUsedError;
  List<LifetimeItemModel> get lifetimeItemList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LifetimeStateCopyWith<LifetimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifetimeStateCopyWith<$Res> {
  factory $LifetimeStateCopyWith(
          LifetimeState value, $Res Function(LifetimeState) then) =
      _$LifetimeStateCopyWithImpl<$Res, LifetimeState>;
  @useResult
  $Res call(
      {LifetimeModel? lifetime,
      List<LifetimeModel> lifetimeList,
      Map<String, LifetimeModel> lifetimeMap,
      List<LifetimeItemModel> lifetimeItemList});
}

/// @nodoc
class _$LifetimeStateCopyWithImpl<$Res, $Val extends LifetimeState>
    implements $LifetimeStateCopyWith<$Res> {
  _$LifetimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lifetime = freezed,
    Object? lifetimeList = null,
    Object? lifetimeMap = null,
    Object? lifetimeItemList = null,
  }) {
    return _then(_value.copyWith(
      lifetime: freezed == lifetime
          ? _value.lifetime
          : lifetime // ignore: cast_nullable_to_non_nullable
              as LifetimeModel?,
      lifetimeList: null == lifetimeList
          ? _value.lifetimeList
          : lifetimeList // ignore: cast_nullable_to_non_nullable
              as List<LifetimeModel>,
      lifetimeMap: null == lifetimeMap
          ? _value.lifetimeMap
          : lifetimeMap // ignore: cast_nullable_to_non_nullable
              as Map<String, LifetimeModel>,
      lifetimeItemList: null == lifetimeItemList
          ? _value.lifetimeItemList
          : lifetimeItemList // ignore: cast_nullable_to_non_nullable
              as List<LifetimeItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LifetimeStateImplCopyWith<$Res>
    implements $LifetimeStateCopyWith<$Res> {
  factory _$$LifetimeStateImplCopyWith(
          _$LifetimeStateImpl value, $Res Function(_$LifetimeStateImpl) then) =
      __$$LifetimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LifetimeModel? lifetime,
      List<LifetimeModel> lifetimeList,
      Map<String, LifetimeModel> lifetimeMap,
      List<LifetimeItemModel> lifetimeItemList});
}

/// @nodoc
class __$$LifetimeStateImplCopyWithImpl<$Res>
    extends _$LifetimeStateCopyWithImpl<$Res, _$LifetimeStateImpl>
    implements _$$LifetimeStateImplCopyWith<$Res> {
  __$$LifetimeStateImplCopyWithImpl(
      _$LifetimeStateImpl _value, $Res Function(_$LifetimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lifetime = freezed,
    Object? lifetimeList = null,
    Object? lifetimeMap = null,
    Object? lifetimeItemList = null,
  }) {
    return _then(_$LifetimeStateImpl(
      lifetime: freezed == lifetime
          ? _value.lifetime
          : lifetime // ignore: cast_nullable_to_non_nullable
              as LifetimeModel?,
      lifetimeList: null == lifetimeList
          ? _value._lifetimeList
          : lifetimeList // ignore: cast_nullable_to_non_nullable
              as List<LifetimeModel>,
      lifetimeMap: null == lifetimeMap
          ? _value._lifetimeMap
          : lifetimeMap // ignore: cast_nullable_to_non_nullable
              as Map<String, LifetimeModel>,
      lifetimeItemList: null == lifetimeItemList
          ? _value._lifetimeItemList
          : lifetimeItemList // ignore: cast_nullable_to_non_nullable
              as List<LifetimeItemModel>,
    ));
  }
}

/// @nodoc

class _$LifetimeStateImpl implements _LifetimeState {
  const _$LifetimeStateImpl(
      {this.lifetime,
      final List<LifetimeModel> lifetimeList = const [],
      final Map<String, LifetimeModel> lifetimeMap = const {},
      final List<LifetimeItemModel> lifetimeItemList = const []})
      : _lifetimeList = lifetimeList,
        _lifetimeMap = lifetimeMap,
        _lifetimeItemList = lifetimeItemList;

  @override
  final LifetimeModel? lifetime;
  final List<LifetimeModel> _lifetimeList;
  @override
  @JsonKey()
  List<LifetimeModel> get lifetimeList {
    if (_lifetimeList is EqualUnmodifiableListView) return _lifetimeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lifetimeList);
  }

  final Map<String, LifetimeModel> _lifetimeMap;
  @override
  @JsonKey()
  Map<String, LifetimeModel> get lifetimeMap {
    if (_lifetimeMap is EqualUnmodifiableMapView) return _lifetimeMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lifetimeMap);
  }

  final List<LifetimeItemModel> _lifetimeItemList;
  @override
  @JsonKey()
  List<LifetimeItemModel> get lifetimeItemList {
    if (_lifetimeItemList is EqualUnmodifiableListView)
      return _lifetimeItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lifetimeItemList);
  }

  @override
  String toString() {
    return 'LifetimeState(lifetime: $lifetime, lifetimeList: $lifetimeList, lifetimeMap: $lifetimeMap, lifetimeItemList: $lifetimeItemList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifetimeStateImpl &&
            (identical(other.lifetime, lifetime) ||
                other.lifetime == lifetime) &&
            const DeepCollectionEquality()
                .equals(other._lifetimeList, _lifetimeList) &&
            const DeepCollectionEquality()
                .equals(other._lifetimeMap, _lifetimeMap) &&
            const DeepCollectionEquality()
                .equals(other._lifetimeItemList, _lifetimeItemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lifetime,
      const DeepCollectionEquality().hash(_lifetimeList),
      const DeepCollectionEquality().hash(_lifetimeMap),
      const DeepCollectionEquality().hash(_lifetimeItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LifetimeStateImplCopyWith<_$LifetimeStateImpl> get copyWith =>
      __$$LifetimeStateImplCopyWithImpl<_$LifetimeStateImpl>(this, _$identity);
}

abstract class _LifetimeState implements LifetimeState {
  const factory _LifetimeState(
      {final LifetimeModel? lifetime,
      final List<LifetimeModel> lifetimeList,
      final Map<String, LifetimeModel> lifetimeMap,
      final List<LifetimeItemModel> lifetimeItemList}) = _$LifetimeStateImpl;

  @override
  LifetimeModel? get lifetime;
  @override
  List<LifetimeModel> get lifetimeList;
  @override
  Map<String, LifetimeModel> get lifetimeMap;
  @override
  List<LifetimeItemModel> get lifetimeItemList;
  @override
  @JsonKey(ignore: true)
  _$$LifetimeStateImplCopyWith<_$LifetimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
