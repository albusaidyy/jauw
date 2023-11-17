import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/five_days_weather.dart';

import '../auth/api_key.dart';
import 'current_weather_provider.dart';

final fiveDaysWetherProvider = FutureProvider.autoDispose((ref) async {
  final location = await ref.watch(locationProvider.future);

  final response =
      await http.get(Uri.http('api.openweathermap.org', '/data/2.5/weather', {
    'lon': '${location.longitude}',
    'lat': '${location.latitude}',
    'units': 'metric',
    'appid': wApiKey
  }));
  //decode the JSON payload
  final json = jsonDecode(response.body);
  // print('five days: $json');
  //Finally, convert the Mao into a CurrentWeather instance
  return FiveDaysWeather.fromJson(json);
});
