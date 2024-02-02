import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/weather_condition.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    required this.weather,
    super.key,
  });

  final WeatherCondition? weather;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: weather?.svg ?? const Placeholder(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<WeatherCondition>('weather', weather));
  }
}
