import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/screens/search_screen/search_screen.dart';
import 'package:weather_app/utils/constants.dart';

import 'add_new_widget.dart';
import 'location_listing_widget.dart';

class SavedLocationsScreen extends StatelessWidget {
  const SavedLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.21, -0.98),
            end: Alignment(0.21, 0.98),
            colors: [
              Color(0xFF391A49),
              Color(0xFF2F1D5B),
              Color(0xFF262171),
              Color(0xFF301D5B),
              Color(0xFF391A49)
            ],
          ),
        ),
        child: const Column(
          children: [
            HeaderSavedLocations(),
            Expanded(child: LocationListingWidget()),
            AddNewWidget(),
          ],
        ),
      )),
    );
  }
}

class HeaderSavedLocations extends StatelessWidget {
  const HeaderSavedLocations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 32, 20),
      child: SizedBox(
        width: double.infinity,
        height: 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Saved Locations',
              style: kRegularFont,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              )),
              child: SvgPicture.asset(
                'assets/images/icon_search.svg',
                height: 32,
                width: 32,
              ),
            )
          ],
        ),
      ),
    );
  }

}
