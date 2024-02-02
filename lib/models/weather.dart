import 'package:flutter_training/converters/date_time_converter.dart';
import 'package:flutter_training/converters/weather_condition_converter.dart';
import 'package:flutter_training/models/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @WeatherConditionConverter() required WeatherCondition weatherCondition,
    required int minTemperature,
    required int maxTemperature,
    @DateTimeConverter() required DateTime date,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
