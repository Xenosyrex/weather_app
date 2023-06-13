import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models_geo.dart';
import 'package:flutter_application_2/my_weather_model.dart';
import 'package:intl/intl.dart';

class RootPage2 extends StatefulWidget {
  final MyWeatherModel response;
  final GeoResponse geoResponse;
  const RootPage2({
    super.key,
    required this.response,
    required this.geoResponse,
  });

  @override
  State<RootPage2> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage2> {
  @override
  Widget build(BuildContext context) {
    final weatherResponse = widget.response;
    final geoResponse = widget.geoResponse;
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('Weather App'),
      //  leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      //),
      body: Column(
        children: [
          // const SizedBox(
          //   //size box 70 az bala
          //   height: 70,
          // ),
          Row(
            children: [
              //size box 30 az chap bara dokme menu
              const SizedBox(
                width: 30,
              ),
              IconButton(
                // dokme menu
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.menu,
                ),
                color: Colors.grey,
                iconSize: 45,
              ),
              const SizedBox(
                // sized box 70 az chap ta text Weather app
                width: 70,
              ),
              const Text(
                'Weather App', // text Weather App
                style: TextStyle(color: Colors.grey, fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            //sized box 35 for image
            height: 35,
          ),
          Image.asset(
            // khorshid
            'images/sun1.png',
            scale: 2,
          ),
          const SizedBox(
            //sized box amoodi after image
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //27 biad vasat
            children: [
              const SizedBox(
                //27 az vasat yekam biad rast
                width: 25,
              ),
              Text(
                '${weatherResponse.weatherForecastList[0].mainForecastItem.temp.round()}',
                style:
                    const TextStyle(fontSize: 140, fontWeight: FontWeight.w300),

                /// 27 text marboote
              ),
              const Text(
                //daraje C
                '°C',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500), // C
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            // London,uk
            '${geoResponse.cityName}, ${geoResponse.countryName}',
            style: const TextStyle(
                fontSize: 20, //london style
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Feels Like ${weatherResponse.weatherForecastList[0].mainForecastItem.feelsLike.round()}', // Feeels Like 30
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Sunrise ${DateFormat().add_jm().format(weatherResponse.cityModel.sunrise)}',

                ///Sunset 07:35
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            //fasele ta tommorow today
            height: 65,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Tommorow',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('7Days',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(
            //fasele ta dokme payina
            height: 45,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...weatherResponse.weatherForecastList.map<Padding>(
                  (forecast) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 85,
                      height: 140,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(DateFormat().add_jm().format(forecast.time)),
                            Image.network(
                              'https://openweathermap.org/img/wn/${forecast.weatherWrapperModel.weatherModelList[0].icon}@2x.png',
                              scale: 3,
                            ),
                            Text('${forecast.mainForecastItem.temp.round()}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // ...List.generate(3, (_) {
                //   return
                //   ;
                // }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 
