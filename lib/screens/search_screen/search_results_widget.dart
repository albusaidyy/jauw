import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/current_weather_provider.dart';
import '../../provider/search_location_provider.dart';
import '../../utils/constants.dart';

class SearchResultsWidget extends ConsumerWidget {
  const SearchResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchLocationProvider);

    return Expanded(
      child: switch (searchProvider) {
        AsyncData(:final value) => value == null
            ? const SizedBox()
            : value.locations.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'No results',
                        style: kBoldFont.copyWith(fontSize: 18),
                      )
                    ],
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.locations.length,
                    itemBuilder: (context, index) {
                      final location = value.locations[index];
                      // final addingToList = ref.watch(addToListProvider);
                      final savedList = [2801268, 279381];

                      return ListTile(
                        title: Text(
                          location.name,
                          style: kMediumFont.copyWith(
                            fontSize: 18,
                            shadows: [
                              const Shadow(
                                color: Color(0x3E000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '${location.region}, ${location.country}',
                          style: kLightFont.copyWith(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.8),
                            shadows: [
                              const Shadow(
                                color: Color(0x3E000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        trailing: savedList.contains(location
                                .id) //check if the id is present in or saved list
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              )
                            : GestureDetector(
                                onTap: () {
                                  ref.watch(currentWeatherProvider(location.id)
                                      .future);

                                  // ref
                                  //     .read(addToListProvider.notifier)
                                  //     .update((state) => !addingToList);
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                      );
                    },
                  ),

        //incase of an error
        AsyncError(:final error) =>
          Text('Oops, something unexpected happened: $error'),
        AsyncLoading() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Searching...',
                style: kBoldFont.copyWith(fontSize: 18),
              )
            ],
          ),
        _ => const SizedBox(),
      },
    );
  }
}
