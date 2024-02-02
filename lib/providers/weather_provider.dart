import 'dart:convert';

import 'package:flutter_training/models/weather.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_provider.g.dart';

@riverpod
class WeatherState extends _$WeatherState {
  @override
  Weather? build() => null;

  void setByJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    state = Weather.fromJson(map);
  }
}
