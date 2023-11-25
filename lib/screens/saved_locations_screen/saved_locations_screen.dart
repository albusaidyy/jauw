import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/provider/saved_list_provider.dart';
import 'package:weather_app/utils/constants.dart';

import 'add_new_widget.dart';
import 'location_listing_widget.dart';

class SavedLocationsScreen extends ConsumerWidget {
  const SavedLocationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        ref.invalidate(searchQueryProvider);
        ref.invalidate(searchListBoolNotifierProvider);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
        ),
      ),
    );
  }
}

class HeaderSavedLocations extends ConsumerWidget {
  const HeaderSavedLocations({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearching = ref.watch(searchListBoolNotifierProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 50, 32, 20),
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
              onTap: () {
                ref.read(searchListBoolNotifierProvider.notifier).update();
              },
              child: isSearching
                  ? const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                      size: 32,
                    )
                  : SvgPicture.asset(
                      'assets/images/icon_search.svg',
                      height: 32,
                      width: 32,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
