import 'package:flutter/material.dart';
import 'package:flutter_training/components/weather_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherView(),
    );
  }
}
