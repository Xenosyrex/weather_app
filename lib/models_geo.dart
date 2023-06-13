/*
[
  {
    "name": "London",
    "lat": 51.5085,
    "lon": -0.1257,
    "country": "GB"
  },
]
*/
//import 'dart:ffi';

/*
class LongitudeInfo {
  final Double longitude;
  LongitudeInfo({required this.longitude});

  factory LongitudeInfo.fromJson(Map<String, dynamic> json) {
    final longitude = json['lon'];
    return LongitudeInfo(longitude: longitude);
  }
}

class LatitudeInfo {
  final Double latitude;
  LatitudeInfo({required this.latitude});

  factory LatitudeInfo.fromJson(Map<String, dynamic> json) {
    final latitude = json['lat'];
    return LatitudeInfo(latitude: latitude);
  }
}
*/
///////////////////////////////
class GeoResponse {
  final String cityName;
  final double latInfo;
  final double lonInfo;
  final String countryName;
  // final double lon;
  GeoResponse(
      {required this.cityName,
      required this.latInfo,
      required this.lonInfo,
      required this.countryName});

  factory GeoResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final latInfo = json['lat'];
    final lonInfo = json['lon'];
    final countryName = json['country'];
    //print(latInfo.runtimeType);
    return GeoResponse(
        cityName: cityName,
        latInfo: latInfo,
        lonInfo: lonInfo,
        countryName: countryName);
  }
}
