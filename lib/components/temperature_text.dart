import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    required this.temperature,
    required this.color,
    super.key,
  });

  final String temperature;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        temperature,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: color),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('temperature', temperature));
    properties.add(ColorProperty('color', color));
  }
}
