import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/next_week_weather.dart';

import '../auth/api_key.dart';
import '../utils/location_utils.dart';
import 'current_weather_provider.dart';
final locationProvider = FutureProvider.autoDispose<Position>((ref) async {
  return await LocationUtils.determinePosition();
});


final nextwkeatherProvider = FutureProvider.autoDispose((ref) async {
  final location = await ref.watch(locationProvider.future);

  final response = await http.get(
    Uri.http(
      'api.weatherapi.com',
      '/v1/forecast.json',
      {
        'q': '${location.latitude},${location.longitude}',
        'days': '14',
        'tp': '24',
        'key': weatherApiKey,
      },
    ),
  );
  //decode the JSON payload
  final json = jsonDecode(response.body);
  return NextWeekWeather.fromJson(json);
});
