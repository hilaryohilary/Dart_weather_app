class Weather {
  final String weatherState;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String countryCode;
  final int pressure;
  final String description;

  @override
  String toString() => """
  Country Code: $countryCode
  Current Temp: ${temp.toStringAsFixed(0)}°C
  Condition Temp: ${weatherState}
  Description: $description
  Daily Min: ${minTemp}°C
  Daily Max: ${maxTemp}°C
  Presure: $pressure
""";

  const Weather(
      {required this.weatherState,
      required this.minTemp,
      required this.maxTemp,
      required this.temp,
      required this.countryCode,
      required this.pressure,
      required this.description});

  static Weather fromJson(Map<String, dynamic> json) => Weather(
      weatherState: json['weather'][0]['main'] as String,
      minTemp: json['main']['temp_min'] as double,
      maxTemp: json['main']['temp_max'] as double,
      temp: json['main']['temp'] as double,
      countryCode: json['sys']['country'],
      pressure: json['main']['pressure'],
      description: json['weather'][0]['description']);
}
