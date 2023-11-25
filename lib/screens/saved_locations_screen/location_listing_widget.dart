import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/next_week_weather.dart';
import 'package:weather_app/provider/search_location_provider.dart';
import 'package:weather_app/screens/saved_locations_screen/search_saved_location_widget.dart';

import '../../provider/saved_list_provider.dart';
import '../../utils/constants.dart';

class LocationListingWidget extends ConsumerWidget {
  const LocationListingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isSearching = ref.watch(searchListBoolNotifierProvider);
    final isResult = ref.watch(noResultBoolNotifierProvider);
    final fetchedSavedList = ref.watch(fetchSavedListProvider);
    final query = ref.watch(searchQueryProvider);
    final searchLSavedistNotifier = ref.watch(searchSavedListNotifierProvider);
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(fetchSavedListProvider.future),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: fetchedSavedList.when(
          data: (data) {
            return Column(
              children: [
                SearchSavedLocatonWidget(query: query, savedList: data),
                Expanded(
                    child: isResult
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'No Results',
                                style: kBoldFont.copyWith(fontSize: 18),
                              )
                            ],
                          )
                        : (data.isEmpty)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'No Saved Locations',
                                    style: kBoldFont.copyWith(fontSize: 18),
                                  )
                                ],
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: searchLSavedistNotifier.isNotEmpty
                                    ? searchLSavedistNotifier.length
                                    : data.length,
                                itemBuilder: (context, index) {
                                  return LocationItem(
                                    weatherData:
                                        searchLSavedistNotifier.isNotEmpty
                                            ? searchLSavedistNotifier[index]
                                            : data[index],
                                  );
                                },
                              )),
              ],
            );
          },
          error: (error, stackTrace) => Text(
            'Oops, something unexpected happened',
            style: kBoldFont.copyWith(fontSize: 18),
          ),
          loading: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 2),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Loading...',
                style: kBoldFont.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  final NextWeekWeather weatherData;
  const LocationItem({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 4),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.60,
                child: Container(
                  width: double.infinity,
                  height: 153,
                  decoration: ShapeDecoration(
                    color: const Color(0xB2AAA5A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 17),
                child: Stack(
                  children: [
                    Positioned(
                      top: 56,
                      right: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weatherData.current.tempC.toStringAsFixed(0),
                            style: kMediumFont.copyWith(
                              fontSize: 48,
                              shadows: [
                                const Shadow(
                                  color: Color(0x3E000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\u00B0C',
                            style: kBoldFont.copyWith(
                              fontSize: 24,
                              shadows: [
                                const Shadow(
                                  color: Color(0x3E000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  weatherData.location.name,
                                  style: kBoldFont.copyWith(
                                    fontSize: 24,
                                    shadows: [
                                      const Shadow(
                                        color: Color(0x3E000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  weatherData.current.condition.text,
                                  style: kMediumFont.copyWith(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.80)),
                                )
                              ],
                            ),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https:${weatherData.current.condition.icon}'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Humidity',
                              style: kLightFont.copyWith(
                                color: Colors.white.withOpacity(0.80),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${weatherData.current.humidity}\u0025',
                              style: kRegularFont.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Wind',
                              style: kLightFont.copyWith(
                                color: Colors.white.withOpacity(0.80),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${weatherData.current.windKph.toStringAsFixed(0)}km/h',
                              style: kRegularFont.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
