// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchWeatherHash() => r'4d1901473911b980f73126a94c44b32e4c54b589';

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

/// See also [fetchWeather].
@ProviderFor(fetchWeather)
const fetchWeatherProvider = FetchWeatherFamily();

/// See also [fetchWeather].
class FetchWeatherFamily extends Family<AsyncValue<Weather>> {
  /// See also [fetchWeather].
  const FetchWeatherFamily();

  /// See also [fetchWeather].
  FetchWeatherProvider call({
    required WeatherRequest weatherRequest,
  }) {
    return FetchWeatherProvider(
      weatherRequest: weatherRequest,
    );
  }

  @override
  FetchWeatherProvider getProviderOverride(
    covariant FetchWeatherProvider provider,
  ) {
    return call(
      weatherRequest: provider.weatherRequest,
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
  String? get name => r'fetchWeatherProvider';
}

/// See also [fetchWeather].
class FetchWeatherProvider extends AutoDisposeFutureProvider<Weather> {
  /// See also [fetchWeather].
  FetchWeatherProvider({
    required WeatherRequest weatherRequest,
  }) : this._internal(
          (ref) => fetchWeather(
            ref as FetchWeatherRef,
            weatherRequest: weatherRequest,
          ),
          from: fetchWeatherProvider,
          name: r'fetchWeatherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchWeatherHash,
          dependencies: FetchWeatherFamily._dependencies,
          allTransitiveDependencies:
              FetchWeatherFamily._allTransitiveDependencies,
          weatherRequest: weatherRequest,
        );

  FetchWeatherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weatherRequest,
  }) : super.internal();

  final WeatherRequest weatherRequest;

  @override
  Override overrideWith(
    FutureOr<Weather> Function(FetchWeatherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchWeatherProvider._internal(
        (ref) => create(ref as FetchWeatherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weatherRequest: weatherRequest,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Weather> createElement() {
    return _FetchWeatherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchWeatherProvider &&
        other.weatherRequest == weatherRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weatherRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchWeatherRef on AutoDisposeFutureProviderRef<Weather> {
  /// The parameter `weatherRequest` of this provider.
  WeatherRequest get weatherRequest;
}

class _FetchWeatherProviderElement
    extends AutoDisposeFutureProviderElement<Weather> with FetchWeatherRef {
  _FetchWeatherProviderElement(super.provider);

  @override
  WeatherRequest get weatherRequest =>
      (origin as FetchWeatherProvider).weatherRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
