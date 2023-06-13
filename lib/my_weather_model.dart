import 'dart:convert';

import 'package:flutter/foundation.dart';

class MyWeatherModel {
  final List<WeatherForecastItem> weatherForecastList;
  final CityModel cityModel;

  MyWeatherModel({
    required this.weatherForecastList,
    required this.cityModel,
  });

  factory MyWeatherModel.fromJson(Map<String, dynamic> json) {
    final forecastList =
        (json['list'] as List).map((e) => e as Map<String, dynamic>);

    final weatherForecastListToReturn = <WeatherForecastItem>[];

    for (var item in forecastList) {
      weatherForecastListToReturn.add(
        WeatherForecastItem.fromJson(item),
      );
    }

    return MyWeatherModel(
      weatherForecastList: weatherForecastListToReturn,
      cityModel: CityModel.fromJson(json['city']),
    );
  }
}

class WeatherForecastItem {
  final DateTime time;
  final MainForecastItem mainForecastItem;
  final WeatherWrapperModel weatherWrapperModel;

  WeatherForecastItem({
    required this.time,
    required this.mainForecastItem,
    required this.weatherWrapperModel,
  });

  factory WeatherForecastItem.fromJson(Map<String, dynamic> json) {
    final weatherListMapStringDynamic = (json['weather'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final dateTimeToReturn =
        DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    return WeatherForecastItem(
      time: dateTimeToReturn,
      mainForecastItem: MainForecastItem.fromJson(json['main']),
      weatherWrapperModel:
          WeatherWrapperModel.fromJson(weatherListMapStringDynamic),
    );
  }
}

class MainForecastItem {
  final double temp;
  final double feelsLike;

  MainForecastItem({
    required this.temp,
    required this.feelsLike,
  });

  factory MainForecastItem.fromJson(Map<String, dynamic> json) {
    return MainForecastItem(
      temp: double.parse(json['temp'].toString()),
      feelsLike: double.parse(json['feels_like'].toString()),
    );
  }
}

class WeatherWrapperModel {
  final List<WeatherModel> weatherModelList;

  WeatherWrapperModel({required this.weatherModelList});

  factory WeatherWrapperModel.fromJson(List<Map<String, dynamic>> jsonList) {
    final List<WeatherModel> listToReturn = <WeatherModel>[];

    for (var json in jsonList) {
      listToReturn.add(WeatherModel.fromJson(json));
    }

    return WeatherWrapperModel(weatherModelList: listToReturn);
  }
}

class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class CityModel {
  final DateTime sunrise;
  final DateTime sunset;

  CityModel({required this.sunrise, required this.sunset});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000),
    );
  }
}
