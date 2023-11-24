// import 'dart:convert';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:weather_app/models/current_weather.dart';
// import 'package:weather_app/utils/extensions.dart';
// import '../auth/api_key.dart';

// // class FetchNotifier extends AutoDisposeNotifier<bool> {
// //   @override
// //   bool build() => false;

// //   void fetch() => state = true;
// // }

// // final fetchNotifierProvider =
// //     NotifierProvider.autoDispose<FetchNotifier, bool>(FetchNotifier.new);

// final currentWeatherProvider =
//     FutureProvider.autoDispose.family<CurrentWeather, int>((ref, cId) async {
//   // We obtain an HTTP client using the extension we created earlier.
//   final client = await ref.getDebouncedHttpClient();
//     //fetching current weather
//   final response = await client.get(
//     Uri.https(
//       'api.weatherapi.com',
//       '/v1/current.json',
//       {
//         'q': 'id:$cId',
//         'key': weatherApiKey,
//       },
//     ),
//   );
//   //decode the JSON payload
//   final json = jsonDecode(response.body);
//   return CurrentWeather.fromJson(json);
// });
