// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherRequestImpl _$$WeatherRequestImplFromJson(Map<String, dynamic> json) =>
    _$WeatherRequestImpl(
      area: json['area'] as String,
      date: const DateTimeConverter().fromJson(json['date'] as String),
    );

Map<String, dynamic> _$$WeatherRequestImplToJson(
        _$WeatherRequestImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': const DateTimeConverter().toJson(instance.date),
    };
