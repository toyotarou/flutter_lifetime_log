// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spend_time_place.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateSpendTimePlaceHash() =>
    r'd13f2f16998de1c61fc187270640660dc40c9e45';

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

/// See also [dateSpendTimePlace].
@ProviderFor(dateSpendTimePlace)
const dateSpendTimePlaceProvider = DateSpendTimePlaceFamily();

/// See also [dateSpendTimePlace].
class DateSpendTimePlaceFamily extends Family<AsyncValue<SpendTimePlaceState>> {
  /// See also [dateSpendTimePlace].
  const DateSpendTimePlaceFamily();

  /// See also [dateSpendTimePlace].
  DateSpendTimePlaceProvider call({
    required String date,
  }) {
    return DateSpendTimePlaceProvider(
      date: date,
    );
  }

  @override
  DateSpendTimePlaceProvider getProviderOverride(
    covariant DateSpendTimePlaceProvider provider,
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
  String? get name => r'dateSpendTimePlaceProvider';
}

/// See also [dateSpendTimePlace].
class DateSpendTimePlaceProvider
    extends AutoDisposeFutureProvider<SpendTimePlaceState> {
  /// See also [dateSpendTimePlace].
  DateSpendTimePlaceProvider({
    required String date,
  }) : this._internal(
          (ref) => dateSpendTimePlace(
            ref as DateSpendTimePlaceRef,
            date: date,
          ),
          from: dateSpendTimePlaceProvider,
          name: r'dateSpendTimePlaceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateSpendTimePlaceHash,
          dependencies: DateSpendTimePlaceFamily._dependencies,
          allTransitiveDependencies:
              DateSpendTimePlaceFamily._allTransitiveDependencies,
          date: date,
        );

  DateSpendTimePlaceProvider._internal(
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
    FutureOr<SpendTimePlaceState> Function(DateSpendTimePlaceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DateSpendTimePlaceProvider._internal(
        (ref) => create(ref as DateSpendTimePlaceRef),
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
  AutoDisposeFutureProviderElement<SpendTimePlaceState> createElement() {
    return _DateSpendTimePlaceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DateSpendTimePlaceProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DateSpendTimePlaceRef
    on AutoDisposeFutureProviderRef<SpendTimePlaceState> {
  /// The parameter `date` of this provider.
  String get date;
}

class _DateSpendTimePlaceProviderElement
    extends AutoDisposeFutureProviderElement<SpendTimePlaceState>
    with DateSpendTimePlaceRef {
  _DateSpendTimePlaceProviderElement(super.provider);

  @override
  String get date => (origin as DateSpendTimePlaceProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
