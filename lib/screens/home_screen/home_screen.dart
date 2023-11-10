import 'package:flutter/material.dart';
import 'package:weather_app/screens/saved_locations_screen/saved_locations_screen.dart';

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
          child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ),
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
                const Text('New York', style: kRegularFont),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SavedLocationsScreen(),
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
                const Text(
                  'June 10',
                  style: kMediumFont,
                ),
                const SizedBox(
                  height: 9.0,
                ),
                Text(
                  'Updated as of 10:14 PM GMT-4',
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
          const MainDetailsWidget(),
          const DetailsWidget(),
          const NextWeekWidget()
        ],
      )),
    );
  }
}
