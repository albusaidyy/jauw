import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/next_week_weather.dart';

import '../auth/api_key.dart';
import 'current_weather_provider.dart';

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
        'key': wethaerApiKey,
      },
    ),
  );
  //decode the JSON payload
  final json = jsonDecode(response.body);
  // print('Next Week: $json');
  //Finally, convert the Mao into a CurrentWeather instance
  return NextWeekWeather.fromJson(json);
});
