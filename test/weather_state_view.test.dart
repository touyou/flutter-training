import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/components/weather_state_view.dart';
import 'package:flutter_training/models/weather.dart';
import 'package:flutter_training/models/weather_condition.dart';
import 'package:flutter_training/models/weather_request.dart';
import 'package:flutter_training/providers/fetch_weather_provider.dart';

void main() {
  testWidgets('widget test', (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(
      const Size(1080, 1920),
    );

    final weatherRequest = WeatherRequest(area: 'tokyo', date: DateTime.now());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fetchWeatherProvider(weatherRequest: weatherRequest)
              .overrideWith((ref) {
            return Weather(
              weatherCondition: WeatherCondition.sunny,
              minTemperature: 10,
              maxTemperature: 20,
              date: DateTime.now(),
            );
          })
        ],
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: WeatherStateView(weatherRequest: weatherRequest),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final minTemperature = find.text('10 ℃');
    final maxTemperature = find.text('20 ℃');

    expect(minTemperature, findsOneWidget);
    expect(maxTemperature, findsOneWidget);
  });
}
