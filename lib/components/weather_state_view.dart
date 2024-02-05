import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/components/temperature_text.dart';
import 'package:flutter_training/components/weather_image.dart';
import 'package:flutter_training/models/weather_request.dart';
import 'package:flutter_training/providers/fetch_weather_provider.dart';

class WeatherStateView extends ConsumerWidget {
  const WeatherStateView({required this.weatherRequest, super.key});

  final WeatherRequest weatherRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(
      fetchWeatherProvider(weatherRequest: weatherRequest)
          .select((weather) => weather.valueOrNull),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherImage(
          weather: weather?.weatherCondition,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              TemperatureText(
                temperature: weather?.minTemperature,
                color: Colors.blue,
              ),
              TemperatureText(
                temperature: weather?.maxTemperature,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<WeatherRequest>('weatherRequest', weatherRequest));
  }
}
