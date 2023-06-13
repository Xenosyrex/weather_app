import 'dart:convert';

import 'package:flutter_application_2/models_geo.dart';
import 'package:flutter_application_2/models_weather.dart';
import 'package:flutter_application_2/my_weather_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<GeoResponse> getGeoLocation(String city) async {
    //http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}
    final queryParameters = {
      'q': city,
      'limit': '5',
      'appid':
          '4b5d657149dfc86f1f9e1d2000403a2f', //98e8dfcf4ea2319b693eb4c58b2a6018
    };
    final uri =
        Uri.https('api.openweathermap.org', '/geo/1.0/direct', queryParameters);
    final response = await http.get(uri);
    //print(response.body);
    final json = jsonDecode(response.body);
    return GeoResponse.fromJson(json[0]);
  }

  Future<MyWeatherModel> getWeather(double lat, double lon) async {
    //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    //api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
    final queryParameters = {
      'lat': '$lat',
      'lon': '$lon',
      'appid':
          '4b5d657149dfc86f1f9e1d2000403a2f', //98e8dfcf4ea2319b693eb4c58b2a6018
      'units': 'metric'
    };
    final uri2 = Uri.https('api.openweathermap.org', 'data/2.5/forecast',
        queryParameters); //data/2.5/forecastdata/2.5/weather
    final response2 = await http.get(uri2);
    print(response2.body);
    final Map<String, dynamic> json = jsonDecode(response2.body);

    return MyWeatherModel.fromJson(json);
  }
}
