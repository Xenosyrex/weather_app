/*
{
  "weather": [
    {
      "id": 501,
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48,
    "feels_like": 298.74,
    "temp_min": 297.56,
    "temp_max": 300.05,
  },
}                                              
*/
/* 5 days weather 3 hour     
{
  "list": [
    {
      "dt": 1661871600,
      "main": {
        "temp": 296.76,
        "feels_like": 296.98,
        "temp_min": 296.76,
        "temp_max": 297.87,
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "dt_txt": "2022-08-30 15:00:00"
    },

    {
      "dt": 1661882400,
      "main": {
        "temp": 295.45,
        "feels_like": 295.59,
        "temp_min": 292.84,
        "temp_max": 295.45,
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "dt_txt": "2022-08-30 18:00:00"
    },

    {
      "dt": 1661893200,
      "main": {
        "temp": 292.46,
        "feels_like": 292.54,
        "temp_min": 290.31,
        "temp_max": 292.46,
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "dt_txt": "2022-08-30 21:00:00"
    },
    ....
  ],
  "city": {
    "name": "Zocca",
    "coord": {
      "lat": 44.34,
      "lon": 10.99
    },
    "country": "IT",
    "population": 4593,
    "timezone": 7200,
    "sunrise": 1661834187,
    "sunset": 1661882248
  }
}
*/

class WeatherInfo {
  final String main;
  final String icon;

  WeatherInfo({required this.main, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final main = json['main'];
    final icon = json['icon'];
    return WeatherInfo(main: main, icon: icon);
  }
}

class TempInfo {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;

  TempInfo(
      {required this.temp,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final feelsLike = json['feels_like'];
    final tempMin = json['temp_min'];
    final tempMax = json['temp_max'];
    return TempInfo(
      temp: temp,
      feels_like: feelsLike,
      temp_min: tempMin,
      temp_max: tempMax,
    );
  }
}

class WeatherResponse {
  final WeatherInfo wInfo;
  final TempInfo tInfo;
  final WeatherInfo wInfo1;
  final TempInfo tInfo1;
  final WeatherInfo wInfo2;
  final TempInfo tInfo2;
  final int sunrise;

  WeatherResponse({
    required this.wInfo,
    required this.tInfo,
    required this.wInfo1,
    required this.tInfo1,
    required this.wInfo2,
    required this.tInfo2,
    required this.sunrise,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> jsonl) {
    // 0
    final jsonsunrise = jsonl['city'];
    final sunrise = jsonsunrise['sunrise'];
    final json = jsonl['list'][0];
    // print(json);
    //final json = jsonl;
    final wInfojason = json['weather'][0];
    final wInfo = WeatherInfo.fromJson(wInfojason);

    final tInfojason = json['main'];
    final tInfo = TempInfo.fromJson(tInfojason);

    // 1
    final json1 = jsonl['list'][1];
    //print(json);
    //final json = jsonl;
    final wInfojason1 = json1['weather'][0];
    final wInfo1 = WeatherInfo.fromJson(wInfojason1);

    final tInfojason1 = json1['main'];
    final tInfo1 = TempInfo.fromJson(tInfojason1);

    // 2
    final json2 = jsonl['list'][0];
    //print(json);
    //final json = jsonl;
    final wInfojason2 = json2['weather'][0];
    final wInfo2 = WeatherInfo.fromJson(wInfojason2);

    final tInfojason2 = json2['main'];
    final tInfo2 = TempInfo.fromJson(tInfojason2);

    //print(wInfo.runtimeType);
    return WeatherResponse(
        wInfo: wInfo,
        tInfo: tInfo,
        wInfo1: wInfo1,
        tInfo1: tInfo1,
        wInfo2: wInfo2,
        tInfo2: tInfo2,
        sunrise: sunrise);
  }
}
