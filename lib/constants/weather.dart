import 'package:flutter_training/constants/weather_condition.dart';

class Weather {
  Weather({
    required this.weatherCondition,
    required this.minTemperature,
    required this.maxTemperature,
    required this.date,
  });

  final WeatherCondition weatherCondition;
  final int minTemperature;
  final int maxTemperature;
  final DateTime date;
}
