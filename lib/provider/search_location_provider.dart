import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:http/http.dart' as http;

import '../auth/api_key.dart';
import '../models/next_week_weather.dart';
import '../models/search_location_model.dart';

final searchStringProvider = StateProvider<String>((ref) => '');
final searchListProvider = StateProvider<List<int>>((ref) => []);

final fetchSavedListProvider = FutureProvider.autoDispose((ref) async {
  // We obtain an HTTP client using the extension we created earlier.
  final client = await ref.getDebouncedHttpClient();

  final savedIds = ref.watch(searchListProvider);
  List<NextWeekWeather> savedList = [];

  for (int id in savedIds) {
    final response = await client.get(
      Uri.http(
        'api.weatherapi.com',
        '/v1/forecast.json',
        {
          'q': 'id:$id',
          'days': '14',
          'tp': '24',
          'key': weatherApiKey,
        },
      ),
    );
    final json = jsonDecode(response.body);
    NextWeekWeather weatherData = NextWeekWeather.fromJson(json);
    savedList.add(weatherData);
  }

  // decode the JSON payload
  return savedList.reversed.toList();
});

final searchLocationProvider = FutureProvider.autoDispose(
  (ref) async {
    // We obtain an HTTP client using the extension we created earlier.
    final client = http.Client();
    ref.onDispose(client.close);

    final searchString = ref.watch(searchStringProvider);

    if (searchString.isEmpty || searchString.contains(RegExp(r'(\d+)'))) {
      // Handle the case where no argument is provided or digits used
      return null;
    }
    final response = await client.get(
      Uri.http(
        'api.weatherapi.com',
        '/v1/search.json',
        {
          'q': searchString,
          'key': weatherApiKey,
        },
      ),
    );
    final json = jsonDecode(response.body);

    return SearchLocation.fromJson(json);
  },
);
