import 'package:flutter/material.dart';
import 'package:flutter_training/components/weather_button.dart';
import 'package:flutter_training/components/weather_state_view.dart';
import 'package:flutter_training/mixin/simple_dialog_mixin.dart';
import 'package:flutter_training/models/weather_request.dart';
import 'package:flutter_training/providers/fetch_weather_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherView extends HookConsumerWidget with SimpleDialogMixin {
  WeatherView({super.key})
      : _weatherRequest = WeatherRequest(area: 'tokyo', date: DateTime.now());

  final WeatherRequest _weatherRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          children: [
            const Spacer(),
            WeatherStateView(weatherRequest: _weatherRequest),
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
                        onPressed: () async => _reloadWeather(context, ref),
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
    WidgetRef ref,
  ) async {
    final error = ref
        .refresh(fetchWeatherProvider(weatherRequest: _weatherRequest))
        .error;
    if (error != null) {
      await showSimpleDialog(context, error.toString());
    }
  }
}
