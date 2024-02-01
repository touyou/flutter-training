import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Weather {
  sunny,
  cloudy,
  rainy;
}

extension WeatherExt on Weather {
  String get assetName {
    switch (this) {
      case Weather.sunny:
        return 'assets/images/sunny.svg';
      case Weather.cloudy:
        return 'assets/images/cloudy.svg';
      case Weather.rainy:
        return 'assets/images/rainy.svg';
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
