import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/current_weather.dart';
import '../auth/api_key.dart';
import '../utils/location_utils.dart';

final locationProvider = FutureProvider.autoDispose<Position>((ref) async {
  return await LocationUtils.determinePosition();
});

final currentWeatherProvider = FutureProvider.autoDispose((ref) async {
  final location = await ref.watch(locationProvider.future);

  //fetching current weather
  final response =
      await http.get(Uri.http('api.openweathermap.org', '/data/2.5/weather', {
    'lon': '${location.longitude}',
    'lat': '${location.latitude}',
    'units': 'metric',
    'appid': wApiKey
  }));

  //decode the JSON payload
  final json = jsonDecode(response.body);
  print(json);
  //Finally, convert the Mao into a CurrentWeather instance
  return CurrentWeather.fromJson(json);
});
