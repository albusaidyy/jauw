import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/current_weather.dart';
import '../auth/api_key.dart';

final currentWeatherProvider = FutureProvider.autoDispose((ref) async {
  //fetching current weather
  final response = await http.get(Uri.http(
      'api.openweathermap.org', '/data/2.5/weather', {
    'lon': '39.687868',
    'lat': '-4.0491681',
    'units': 'metric',
    'appid': wApiKey
  }));

  //decode the JSON payload
  final json = jsonDecode(response.body);
  print(json);
  //Finally, convert the Mao into a CurrentWeather instance
  return CurrentWeather.fromJson(json);
});
