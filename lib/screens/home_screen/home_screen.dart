import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/screens/saved_locations_screen/saved_locations_screen.dart';
import 'package:weather_app/utils/formart_utils.dart';

import '../../provider/current_weather_provider.dart';
import '../../utils/constants.dart';
import 'details_widget.dart';
import 'main_details_widget.dart';
import 'next_week_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final AsyncValue<CurrentWeather> currentWeather =
                ref.watch(currentWeatherProvider);

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover),
              ),
              child: switch (currentWeather) {
                AsyncData(:final value) => Stack(
                    children: [
                      Positioned(
                        top: 32,
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
                            Text(value.name!, style: kRegularFont),
                            const Spacer(),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
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
                        top: 125,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FormartUtils.formatDate(value.dt!),
                              style: kMediumFont,
                            ),
                            const SizedBox(
                              height: 9.0,
                            ),
                            Text(
                              'Updated as of ${FormartUtils().formatDateTimeWithTimeZone(dt: value.dt!,timeZone: value.timezone!)}',
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
                          value: value.weather!, mMain: value.mMain!),
                      DetailsWidget(wind: value.wind!, mMain: value.mMain!),
                      const NextWeekWidget()
                    ],
                  ),
                //incase of an error
                AsyncError(:final error) =>
                  Text('Oops, something unexpected happened: $error'),
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
            );
          },
        ),
      )),
    );
  }
}
