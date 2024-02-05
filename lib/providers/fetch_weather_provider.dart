import 'dart:convert';

import 'package:flutter_training/models/weather.dart';
import 'package:flutter_training/models/weather_request.dart';
import 'package:flutter_training/providers/yumemi_weather_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_weather_provider.g.dart';

@riverpod
Future<Weather> fetchWeather(
  FetchWeatherRef ref, {
  required WeatherRequest weatherRequest,
}) async {
  final yumemiWeatherClient = ref.watch(yumemiWeatherProvider);
  final jsonText = jsonEncode(weatherRequest.toJson());
  final json = yumemiWeatherClient.fetchWeather(jsonText);
  final map = jsonDecode(json) as Map<String, dynamic>;
  return Weather.fromJson(map);
}
