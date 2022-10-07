import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather.dart';

class WeatherApiClient {
  static const Map<String, String> api = {
    "key": "8a14449c6a937caf9358169e1f166181",
    "base": "https://api.openweathermap.org/data/2.5/",
  };

  Future<Map<String, dynamic>> getFullWeatherDetails(String city) async {
    final weatherDetailUrl = Uri.parse(
        '${api['base']}/weather?q=$city&units=metric&APPID=${api['key']}');
    print(weatherDetailUrl);
    final weatherDetailResponse = await http.get(weatherDetailUrl);
    if (weatherDetailResponse.statusCode != 200) {
      throw Exception('Error getting weather details for city: $city');
    }
    final weatherDetailJson = jsonDecode(weatherDetailResponse.body);
    if (weatherDetailJson == null) {
      throw Exception('No details found');
    }
    return weatherDetailJson;
  }

  Future<Weather> fetchWeather(String city) async {
    final weatherJson = await this.getFullWeatherDetails(city);
    print(weatherJson['sys']['country']);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getWeather(String city) async {
    final weatherResults = await fetchWeather(city);
    print(weatherResults);
    return weatherResults;
  }
}
