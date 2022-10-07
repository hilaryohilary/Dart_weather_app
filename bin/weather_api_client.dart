import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather.dart';

class WeatherApiClient {
  static const Map<String, String> api = {
    "key": "8a14449c6a937caf9358169e1f166181",
    "base": "https://api.openweathermap.org/data/2.5/",
  };

  Future<Map<String, dynamic>> getLocationId(String city) async {
    final locationUrl = Uri.parse(
        '${api['base']}/weather?q=$city&units=metric&APPID=${api['key']}');
    print(locationUrl);
    final locationResponse = await http.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('Error getting locationId for city: $city');
    }
    final locationJson = jsonDecode(locationResponse.body);
    return locationJson;
  }

  Future<Weather> fetchWeather(String city) async {
    final weatherJson = await this.getLocationId(city);
    print(weatherJson['sys']['country']);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getWeather(String city) async {
    final weatherResults = await fetchWeather(city);
    print(weatherResults);
    return weatherResults;
  }
}
