import 'package:flutter/material.dart';
import 'package:flutter_training/views/weather_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: WeatherView(),
      ),
    );
  }
}
