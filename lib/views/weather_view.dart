import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_training/constants/weather.dart';
import 'package:flutter_training/providers/yumemi_weather_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherView extends HookConsumerWidget {
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
                AspectRatio(
                  aspectRatio: 1,
                  child: weather.value?.svg ?? const Placeholder(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '** ℃',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '** ℃',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.red),
                        ),
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
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Close',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            final weatherCondition =
                                yumemiWeather.fetchSimpleWeather();
                            weather.value =
                                Weather.values.byName(weatherCondition);
                          },
                          child: const Text(
                            'Reload',
                            textAlign: TextAlign.center,
                          ),
                        ),
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
}
