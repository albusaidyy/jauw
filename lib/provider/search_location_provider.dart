import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/utils/w_extensions.dart';

import '../auth/api_key.dart';
import '../models/search_location_model.dart';

final searchStringProvider = StateProvider<String>((ref) => '');

final searchLocationProvider = FutureProvider.autoDispose(
  (ref) async {
    // We obtain an HTTP client using the extension we created earlier.
    final client = await ref.getDebouncedHttpClient();

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
    // Decode the JSON payload
    final json = jsonDecode(response.body);

    // Finally, convert the Map into a SearchLocation instance
    return SearchLocation.fromJson(json);
  },
);
