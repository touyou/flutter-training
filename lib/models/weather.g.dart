// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      weatherCondition:
          $enumDecode(_$WeatherConditionEnumMap, json['weather_condition']),
      minTemperature: json['min_temperature'] as int,
      maxTemperature: json['max_temperature'] as int,
      date: const DateTimeConverter().fromJson(json['date'] as String),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'weather_condition':
          _$WeatherConditionEnumMap[instance.weatherCondition]!,
      'min_temperature': instance.minTemperature,
      'max_temperature': instance.maxTemperature,
      'date': const DateTimeConverter().toJson(instance.date),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.rainy: 'rainy',
};
