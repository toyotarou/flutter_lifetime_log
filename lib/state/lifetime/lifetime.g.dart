// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifetime.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateLifetimeHash() => r'56e67a4b0707c7e22e80f86ba45ff1705d3e22ef';

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

/// See also [dateLifetime].
@ProviderFor(dateLifetime)
const dateLifetimeProvider = DateLifetimeFamily();

/// See also [dateLifetime].
class DateLifetimeFamily extends Family<AsyncValue<LifetimeState>> {
  /// See also [dateLifetime].
  const DateLifetimeFamily();

  /// See also [dateLifetime].
  DateLifetimeProvider call({
    required String date,
  }) {
    return DateLifetimeProvider(
      date: date,
    );
  }

  @override
  DateLifetimeProvider getProviderOverride(
    covariant DateLifetimeProvider provider,
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
  String? get name => r'dateLifetimeProvider';
}

/// See also [dateLifetime].
class DateLifetimeProvider extends AutoDisposeFutureProvider<LifetimeState> {
  /// See also [dateLifetime].
  DateLifetimeProvider({
    required String date,
  }) : this._internal(
          (ref) => dateLifetime(
            ref as DateLifetimeRef,
            date: date,
          ),
          from: dateLifetimeProvider,
          name: r'dateLifetimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateLifetimeHash,
          dependencies: DateLifetimeFamily._dependencies,
          allTransitiveDependencies:
              DateLifetimeFamily._allTransitiveDependencies,
          date: date,
        );

  DateLifetimeProvider._internal(
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
    FutureOr<LifetimeState> Function(DateLifetimeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DateLifetimeProvider._internal(
        (ref) => create(ref as DateLifetimeRef),
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
  AutoDisposeFutureProviderElement<LifetimeState> createElement() {
    return _DateLifetimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DateLifetimeProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DateLifetimeRef on AutoDisposeFutureProviderRef<LifetimeState> {
  /// The parameter `date` of this provider.
  String get date;
}

class _DateLifetimeProviderElement
    extends AutoDisposeFutureProviderElement<LifetimeState>
    with DateLifetimeRef {
  _DateLifetimeProviderElement(super.provider);

  @override
  String get date => (origin as DateLifetimeProvider).date;
}

String _$lifetimeHash() => r'5b20f4e814abf219d6d7fe177ecf1a4d5b29316a';

/// See also [Lifetime].
@ProviderFor(Lifetime)
final lifetimeProvider =
    AutoDisposeNotifierProvider<Lifetime, LifetimeState>.internal(
  Lifetime.new,
  name: r'lifetimeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lifetimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Lifetime = AutoDisposeNotifier<LifetimeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
