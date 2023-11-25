import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/provider/next_week_weather_provider.dart';
import 'package:weather_app/screens/saved_locations_screen/saved_locations_screen.dart';
import 'package:weather_app/utils/formart_utils.dart';

import '../../utils/constants.dart';
import 'details_widget.dart';
import 'main_details_widget.dart';
import 'next_week_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    final nextWeekWeather = ref.watch(nextwkeatherProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator(
          onRefresh: () => ref.refresh(nextwkeatherProvider.future),
          backgroundColor: Colors.white,
          color: Colors.blue,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/download.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  child: switch (nextWeekWeather) {
                    AsyncData(:final valueOrNull?) => Stack(
                        children: [
                          Visibility(
                            visible:
                                setBackroundImage(valueOrNull.location.name)[0],
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/${setBackroundImage(valueOrNull.location.name)[1]}'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(
                                  setBackgroundOpacity(
                                      valueOrNull.current.condition.code)),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            left: 24,
                            right: 24,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  shadows: [
                                    Shadow(
                                        color: Color(0x3E000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4))
                                  ],
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 31.44,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(valueOrNull.location.name,
                                    style: kRegularFont),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SavedLocationsScreen(),
                                  )),
                                  child: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 32,
                                    shadows: [
                                      Shadow(
                                        color: Color(0x3E000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 143,
                            left: 0,
                            right: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FormartUtils.formatDate(
                                      valueOrNull.location.localtimeEpoch),
                                  style: kMediumFont,
                                ),
                                const SizedBox(
                                  height: 9.0,
                                ),
                                Text(
                                  'Updated as of ${FormartUtils().formatDateTimeWithTimeZone(
                                    dt: valueOrNull.location.localtimeEpoch,
                                    localTime: valueOrNull.location.localtime,
                                    // timeZone: value.timezone!
                                  )}',
                                  style: kLightFont.copyWith(
                                    shadows: [
                                      const Shadow(
                                        color: Color(0x3E000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          MainDetailsWidget(
                            wCurrent: valueOrNull.current,
                          ),
                          DetailsWidget(current: valueOrNull.current),
                          NextWeekWidget(
                            forecastDay: valueOrNull.forecast.forecastday,
                          )
                        ],
                      ),
                    //incase of an error
                    // ignore: unused_local_variable
                    AsyncError(:final error) => Text(
                        'Oops, something unexpected happened',
                        style: kBoldFont.copyWith(fontSize: 18),
                      ),
                    _ => Column(
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
                          )
                        ],
                      ),
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
