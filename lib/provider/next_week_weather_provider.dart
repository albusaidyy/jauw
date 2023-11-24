import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/next_week_weather.dart';

import '../auth/api_key.dart';
import '../utils/location_utils.dart';

final locationProvider = FutureProvider.autoDispose<Position>((ref) async {
  return await LocationUtils.determinePosition();
});

final nextwkeatherProvider = FutureProvider.autoDispose((ref) async {
  var didDispose = false;
  ref.onDispose(() => didDispose = true);

  //we delay the request by 500ms, to wait for the user to stop refreshing
  await Future<void>.delayed(const Duration(milliseconds: 500));

  //if the provider was disposed during the delay, it means that the user
  //refreshed again. we throw an exception and cacel the request.
  //It is safe to use an exception it will be caught by Riverpod.
  if (didDispose) {
    throw Exception('Cancelled');
  }
  final location = await ref.watch(locationProvider.future);
  final client = http.Client();

  //on dispose, we close the client.
  //This will cancel any pending request that the client might have
  ref.onDispose(client.close);

  final response = await client.get(
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


