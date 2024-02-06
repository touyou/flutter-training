import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/models/weather.dart';
import 'package:flutter_training/models/weather_condition.dart';
import 'package:flutter_training/models/weather_request.dart';
import 'package:flutter_training/providers/fetch_weather_provider.dart';
import 'package:flutter_training/providers/yumemi_weather_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'fetch_weather_provider.test.mocks.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  addTearDown(container.dispose);

  return container;
}

@GenerateMocks([YumemiWeather])
void main() {
  final yumemiWeather = MockYumemiWeather();
  test('fetch weather', () async {
    when(yumemiWeather.fetchWeather(any)).thenAnswer(
      (_) => '''
      {
        "weather_condition": "sunny",
        "min_temperature": 20,
        "max_temperature": 30,
        "date": "2022-01-01"
      }
    ''',
    );
    final container = createContainer(
      overrides: [
        yumemiWeatherProvider.overrideWith(
          (ref) => yumemiWeather,
        ),
      ],
    );
    final weatherRequest = WeatherRequest(area: 'tokyo', date: DateTime.now());

    expect(
      container.read(fetchWeatherProvider(weatherRequest: weatherRequest)),
      const AsyncValue<Weather>.loading(),
    );

    await Future<void>.value();

    expect(
      container
          .read(fetchWeatherProvider(weatherRequest: weatherRequest))
          .value,
      equals(
        Weather(
          weatherCondition: WeatherCondition.sunny,
          minTemperature: 20,
          maxTemperature: 30,
          date: DateTime(2022, 1),
        ),
      ),
    );
  });
}
