// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spend.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateSpendHash() => r'ad28d98d65a181c9d79a8b6cc1e28056cb6daab2';

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

/// See also [dateSpend].
@ProviderFor(dateSpend)
const dateSpendProvider = DateSpendFamily();

/// See also [dateSpend].
class DateSpendFamily extends Family<AsyncValue<SpendState>> {
  /// See also [dateSpend].
  const DateSpendFamily();

  /// See also [dateSpend].
  DateSpendProvider call({
    required String date,
  }) {
    return DateSpendProvider(
      date: date,
    );
  }

  @override
  DateSpendProvider getProviderOverride(
    covariant DateSpendProvider provider,
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
  String? get name => r'dateSpendProvider';
}

/// See also [dateSpend].
class DateSpendProvider extends AutoDisposeFutureProvider<SpendState> {
  /// See also [dateSpend].
  DateSpendProvider({
    required String date,
  }) : this._internal(
          (ref) => dateSpend(
            ref as DateSpendRef,
            date: date,
          ),
          from: dateSpendProvider,
          name: r'dateSpendProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateSpendHash,
          dependencies: DateSpendFamily._dependencies,
          allTransitiveDependencies: DateSpendFamily._allTransitiveDependencies,
          date: date,
        );

  DateSpendProvider._internal(
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
    FutureOr<SpendState> Function(DateSpendRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DateSpendProvider._internal(
        (ref) => create(ref as DateSpendRef),
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
  AutoDisposeFutureProviderElement<SpendState> createElement() {
    return _DateSpendProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DateSpendProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DateSpendRef on AutoDisposeFutureProviderRef<SpendState> {
  /// The parameter `date` of this provider.
  String get date;
}

class _DateSpendProviderElement
    extends AutoDisposeFutureProviderElement<SpendState> with DateSpendRef {
  _DateSpendProviderElement(super.provider);

  @override
  String get date => (origin as DateSpendProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
