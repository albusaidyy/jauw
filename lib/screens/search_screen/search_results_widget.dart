import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/search_location_model.dart';

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

                      return SearchResultItem(
                          location: location, savedList: savedList);
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

class SearchResultItem extends ConsumerStatefulWidget {
  const SearchResultItem({
    super.key,
    required this.location,
    required this.savedList,
  });

  final SLocation location;
  final List<int> savedList;

  @override
  ConsumerState<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends ConsumerState<SearchResultItem> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AsyncValue<CurrentWeather>? getCurrentWeather;

    if (isLoading)
      // ignore: curly_braces_in_flow_control_structures
      getCurrentWeather = ref.watch(currentWeatherProvider(widget.location.id));

    return ListTile(
      title: Text(
        widget.location.name,
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
        '${widget.location.region}${widget.location.region.isNotEmpty ? ', ' : ''}${widget.location.country}',
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
      trailing: widget.savedList.contains(
              widget.location.id) //check if the id is present in or saved list
          ? Icon(
              Icons.check,
              color: Colors.white.withOpacity(0.8),
              size: 18,
            )
          : !isLoading
              ? GestureDetector(
                  onTap: () => setState(() => isLoading = true),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              : SizedBox(child: Consumer(
                  builder: (context, ref, child) {
                    final getCurrentWeather =
                        ref.watch(currentWeatherProvider(widget.location.id));
                    return getCurrentWeather.when(
                      data: (_) {
                        widget.savedList.add(widget.location.id);
                        print(widget.savedList);
                        return Icon(
                          Icons.check,
                          color: Colors.white.withOpacity(0.8),
                          size: 18,
                        );
                      },
                      error: (error, _) {
                        print(error);
                        return const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 18,
                        );
                      },
                      loading: () {
                        return const SizedBox(
                          width: 18,
                          height: 18,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
    );
  }
}
