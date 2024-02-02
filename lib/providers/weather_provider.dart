import 'dart:convert';

import 'package:flutter_training/constants/weather.dart';
import 'package:flutter_training/constants/weather_condition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_provider.g.dart';

@riverpod
class WeatherState extends _$WeatherState {
  @override
  Weather? build() => null;

  void setByJson(String json) {
    final map = jsonDecode(json);
    final weatherCondition =
        WeatherConditionExt.fromString(map['weather_condition'] as String);
    final minTemperature = map['min_temperature'] as int;
    final maxTemperature = map['max_temperature'] as int;
    final date = DateTime.parse(map['date'] as String);
    state = Weather(
      weatherCondition: weatherCondition,
      minTemperature: minTemperature,
      maxTemperature: maxTemperature,
      date: date,
    );
  }
}
