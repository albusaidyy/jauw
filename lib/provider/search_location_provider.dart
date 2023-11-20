import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../auth/api_key.dart';
import '../models/search_location_model.dart';

// final searchLocaionNotifierProvider = AsyncNotifierProvider.autoDispose
//     .family<SearchLocationNotifier, SearchLocation, String>(
//   SearchLocationNotifier.new,
// );
// class SearchLocationNotifier
//     extends AutoDisposeFamilyAsyncNotifier<SearchLocation, String> {
//   @override
//   FutureOr<SearchLocation> build(String? arg) async {
//     if (arg!.isNotEmpty) {
//       final response = await http.get(
//         Uri.http(
//           'api.weatherapi.com',
//           '/v1/search.json',
//           {
//             'q': this.arg,
//             'key': weatherApiKey,
//           },
//         ),
//       );
//       // Decode the JSON payload
//       final json = jsonDecode(response.body);
//       print('Location: $json');
//       // Finally, convert the Map into a SearchLocation instance
//       return SearchLocation.fromJson(json);
//     } else {
//       // Handle the case where no argument is provided
//       // For example, you might want to yield a default or empty result
//       return SearchLocation(locations: []);
//     }
//   }
// }
// final searchCityProvider = StreamProvider.autoDispose
//     .family<SearchLocation, String?>((ref, locationName) async* {
//   if (locationName != null && locationName.isNotEmpty) {
//     final response = await http.get(
//       Uri.http(
//         'api.weatherapi.com',
//         '/v1/search.json',
//         {
//           'q': locationName,
//           'key': weatherApiKey,
//         },
//       ),
//     );
//     // Decode the JSON payload
//     final json = jsonDecode(response.body);
//     print('Location: $json');
//     // Finally, convert the Map into a SearchLocation instance
//     yield SearchLocation.fromJson(json);
//   } else {
//     // Handle the case where no argument is provided
//     // For example, you might want to yield a default or empty result
//     yield SearchLocation(locations: []);
//   }
// });

final searchStringProvider = StateProvider<String>((ref) => '');

final searchLocationProvider = FutureProvider.autoDispose((ref) async {
  final searchString = ref.watch(searchStringProvider);

  if (searchString.isNotEmpty) {
    final response = await http.get(
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
    print('Location: $json');
    // Finally, convert the Map into a SearchLocation instance
    return SearchLocation.fromJson(json);
  } else {
    // Handle the case where no argument is provided
    // For example, you might want to yield a default or empty result
    return SearchLocation(locations: []);
  }
});
