import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/utils/w_extensions.dart';
import '../auth/api_key.dart';

final currentWeatherProvider =
    FutureProvider.autoDispose.family<CurrentWeather, int>((ref, cId) async {
  // We obtain an HTTP client using the extension we created earlier.
  final client = await ref.getDebouncedHttpClient();

  //fetching current weather
  final response = await client.get(
    Uri.https(
      'api.weatherapi.com',
      '/v1/current.json',
      {
        'q': 'id:$cId',
        'key': weatherApiKey,
      },
    ),
  );

  //decode the JSON payload
  final json = jsonDecode(response.body);
  print('current: $json');
  //Finally, convert the Mao into a CurrentWeather instance
  return CurrentWeather.fromJson(json);
});
