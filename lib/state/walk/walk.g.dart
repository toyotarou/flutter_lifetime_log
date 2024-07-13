// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateWalkHash() => r'0875c173f66e74817a86eb5cfdddd507033b162f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [dateWalk].
@ProviderFor(dateWalk)
const dateWalkProvider = DateWalkFamily();

/// See also [dateWalk].
class DateWalkFamily extends Family<AsyncValue<WalkState>> {
  /// See also [dateWalk].
  const DateWalkFamily();

  /// See also [dateWalk].
  DateWalkProvider call({
    required String date,
  }) {
    return DateWalkProvider(
      date: date,
    );
  }

  @override
  DateWalkProvider getProviderOverride(
    covariant DateWalkProvider provider,
  ) {
    return call(
      date: provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dateWalkProvider';
}

/// See also [dateWalk].
class DateWalkProvider extends AutoDisposeFutureProvider<WalkState> {
  /// See also [dateWalk].
  DateWalkProvider({
    required String date,
  }) : this._internal(
          (ref) => dateWalk(
            ref as DateWalkRef,
            date: date,
          ),
          from: dateWalkProvider,
          name: r'dateWalkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateWalkHash,
          dependencies: DateWalkFamily._dependencies,
          allTransitiveDependencies: DateWalkFamily._allTransitiveDependencies,
          date: date,
        );

  DateWalkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final String date;

  @override
  Override overrideWith(
    FutureOr<WalkState> Function(DateWalkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DateWalkProvider._internal(
        (ref) => create(ref as DateWalkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WalkState> createElement() {
    return _DateWalkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DateWalkProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DateWalkRef on AutoDisposeFutureProviderRef<WalkState> {
  /// The parameter `date` of this provider.
  String get date;
}

class _DateWalkProviderElement
    extends AutoDisposeFutureProviderElement<WalkState> with DateWalkRef {
  _DateWalkProviderElement(super.provider);

  @override
  String get date => (origin as DateWalkProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
