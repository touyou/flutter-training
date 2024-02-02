import 'package:flutter_training/models/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class WeatherConditionConverter
    implements JsonConverter<WeatherCondition?, String?> {
  const WeatherConditionConverter();

  @override
  WeatherCondition? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WeatherConditionExt.fromString(json);
  }

  @override
  String? toJson(WeatherCondition? object) {
    return object?.toString().split('.').last;
  }
}
