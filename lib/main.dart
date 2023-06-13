import 'package:flutter/material.dart';
import 'package:flutter_application_2/data_service.dart';
import 'package:flutter_application_2/models_geo.dart';
import 'package:flutter_application_2/models_weather.dart';
import 'package:flutter_application_2/my_weather_model.dart';
import 'package:flutter_application_2/second_page.dart';
//import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData.dark(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyappState();
}

//String _cityTextController = 'sss';

class _MyappState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    //theme: ThemeData.dark(),
    //home: Scaffold(
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityTextController,
                  decoration: const InputDecoration(labelText: 'City'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SingleChildScrollView(),
            ElevatedButton(
                onPressed: () async {
                  final geoResponse = await _searchGeo();
                  final weatherResponse = await _getWeather(
                    geoResponse: geoResponse,
                  );
                  _cityTextController.clear();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RootPage2(
                        response: weatherResponse,
                        geoResponse: geoResponse,
                      ),
                    ),
                  );
                },
                child: const Text('Search')),
          ],
        ),
      ),
    );
  }

  Future<GeoResponse> _searchGeo() async {
    final response =
        await _dataService.getGeoLocation(_cityTextController.text);
    //print(response);

    return response;
  }

  Future<MyWeatherModel> _getWeather({
    required GeoResponse geoResponse,
  }) async {
    final response2 =
        await _dataService.getWeather(geoResponse.latInfo, geoResponse.lonInfo);
    return response2;
  }
  // print(response.cityName);
  // print(response.latInfo);
  // print(response.lonInfo);
  // print(response.countryName);
  //print(response2.wInfo.main);
  //print(response2.wInfo.icon);
  // print(response2.tInfo.temp);
}
