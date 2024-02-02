import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_training/components/temperature_text.dart';
import 'package:flutter_training/components/weather_button.dart';
import 'package:flutter_training/components/weather_image.dart';
import 'package:flutter_training/constants/weather.dart';
import 'package:flutter_training/mixin/simple_dialog_mixin.dart';
import 'package:flutter_training/providers/yumemi_weather_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherView extends HookConsumerWidget with SimpleDialogMixin {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yumemiWeather = ref.watch(yumemiWeatherProvider);
    final weather = useState<Weather?>(null);

    return SizedBox.expand(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          children: [
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WeatherImage(
                  weather: weather.value,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      TemperatureText(
                        temperature: '** ℃',
                        color: Colors.blue,
                      ),
                      TemperatureText(
                        temperature: '** ℃',
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Row(
                    children: [
                      WeatherButton(
                        onPressed: () => _closePage(context),
                        text: 'Close',
                      ),
                      WeatherButton(
                        onPressed: () async =>
                            _reloadWeather(context, yumemiWeather, weather),
                        text: 'Reload',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _closePage(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> _reloadWeather(
    BuildContext context,
    YumemiWeather yumemiWeather,
    ValueNotifier<Weather?> weather,
  ) async {
    const jsonText = '''
      {
        "area": "tokyo",
        "date": "2020-04-01T12:00:00+09:00"
      }
    ''';
    try {
      // NOTE: {"weather_condition":"cloudy","max_temperature":27,"min_temperature":9,"date":"2020-04-01T12:00:00+09:00"}
      final weatherCondition = yumemiWeather.fetchWeather(jsonText);
      print(weatherCondition);
      weather.value = WeatherExt.fromString(weatherCondition);
    } on YumemiWeatherError {
      await showSimpleDialog(context, 'APIエラー');
    } on Exception {
      await showSimpleDialog(context, '引数エラー');
    }
  }
}
