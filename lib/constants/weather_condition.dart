import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

enum WeatherCondition {
  sunny,
  cloudy,
  rainy;
}

extension WeatherConditionExt on WeatherCondition {
  String get assetName {
    switch (this) {
      case WeatherCondition.sunny:
        return Assets.images.sunny;
      case WeatherCondition.cloudy:
        return Assets.images.cloudy;
      case WeatherCondition.rainy:
        return Assets.images.rainy;
    }
  }

  Widget get svg {
    return SvgPicture.asset(assetName);
  }

  static WeatherCondition fromString(String name) {
    switch (name) {
      case 'sunny':
        return WeatherCondition.sunny;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'rainy':
        return WeatherCondition.rainy;
      default:
        throw Exception('Unknown weather: $name');
    }
  }
}
