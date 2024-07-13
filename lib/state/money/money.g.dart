// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateMoneyHash() => r'458051d5d884435961f9aac63da430377987a2d5';

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

/// See also [dateMoney].
@ProviderFor(dateMoney)
const dateMoneyProvider = DateMoneyFamily();

/// See also [dateMoney].
class DateMoneyFamily extends Family<AsyncValue<MoneyState>> {
  /// See also [dateMoney].
  const DateMoneyFamily();

  /// See also [dateMoney].
  DateMoneyProvider call({
    required String date,
  }) {
    return DateMoneyProvider(
      date: date,
    );
  }

  @override
  DateMoneyProvider getProviderOverride(
    covariant DateMoneyProvider provider,
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
  String? get name => r'dateMoneyProvider';
}

/// See also [dateMoney].
class DateMoneyProvider extends AutoDisposeFutureProvider<MoneyState> {
  /// See also [dateMoney].
  DateMoneyProvider({
    required String date,
  }) : this._internal(
          (ref) => dateMoney(
            ref as DateMoneyRef,
            date: date,
          ),
          from: dateMoneyProvider,
          name: r'dateMoneyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateMoneyHash,
          dependencies: DateMoneyFamily._dependencies,
          allTransitiveDependencies: DateMoneyFamily._allTransitiveDependencies,
          date: date,
        );

  DateMoneyProvider._internal(
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
    FutureOr<MoneyState> Function(DateMoneyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DateMoneyProvider._internal(
        (ref) => create(ref as DateMoneyRef),
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
  AutoDisposeFutureProviderElement<MoneyState> createElement() {
    return _DateMoneyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DateMoneyProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DateMoneyRef on AutoDisposeFutureProviderRef<MoneyState> {
  /// The parameter `date` of this provider.
  String get date;
}

class _DateMoneyProviderElement
    extends AutoDisposeFutureProviderElement<MoneyState> with DateMoneyRef {
  _DateMoneyProviderElement(super.provider);

  @override
  String get date => (origin as DateMoneyProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
