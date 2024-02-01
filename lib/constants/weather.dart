import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

enum Weather {
  sunny,
  cloudy,
  rainy;
}

extension WeatherExt on Weather {
  String get assetName {
    switch (this) {
      case Weather.sunny:
        return Assets.images.sunny;
      case Weather.cloudy:
        return Assets.images.cloudy;
      case Weather.rainy:
        return Assets.images.rainy;
    }
  }

  Widget get svg {
    return SvgPicture.asset(assetName);
  }

  static Weather fromString(String name) {
    switch (name) {
      case 'sunny':
        return Weather.sunny;
      case 'cloudy':
        return Weather.cloudy;
      case 'rainy':
        return Weather.rainy;
      default:
        throw Exception('Unknown weather: $name');
    }
  }
}
