// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      weatherCondition: const WeatherConditionConverter()
          .fromJson(json['weather_condition'] as String),
      minTemperature: json['min_temperature'] as int,
      maxTemperature: json['max_temperature'] as int,
      date: const DateTimeConverter().fromJson(json['date'] as String),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'weather_condition':
          const WeatherConditionConverter().toJson(instance.weatherCondition),
      'min_temperature': instance.minTemperature,
      'max_temperature': instance.maxTemperature,
      'date': const DateTimeConverter().toJson(instance.date),
    };
