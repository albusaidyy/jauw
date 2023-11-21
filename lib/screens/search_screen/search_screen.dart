import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/provider/current_weather_provider.dart';
import 'package:weather_app/provider/search_location_provider.dart';
import 'package:weather_app/utils/w_extensions.dart';

import '../../models/search_location_model.dart';
import '../../utils/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
          child: const SearchWidget(),
        ),
      ),
    );
  }
}

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  bool isTapped = false;
  late FocusNode _focusNode;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 4),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.60,
                child: Container(
                  width: double.infinity,
                  height: 59,
                  decoration: ShapeDecoration(
                    color: const Color(0xB2AAA5A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          ref
                              .read(searchStringProvider.notifier)
                              .update((state) => value);
                        },
                        focusNode: _focusNode,
                        onTap: () {
                          setState(() {
                            isTapped = !isTapped;
                          });
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.80),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          suffixIcon: _focusNode.hasFocus
                              ? GestureDetector(
                                  onTap: () {
                                    // Dismiss the keyboard
                                    FocusScope.of(context).unfocus();
                                    !_focusNode.hasFocus;
                                    //remove the search string
                                    ref.invalidate(searchStringProvider);
                                    // .read(searchStringProvider.notifier)
                                    // .update((state) => '');
                                    _controller.text = '';
                                  },
                                  child: const Icon(
                                    Icons.cancel_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              : Transform.scale(
                                  scale: 0.5,
                                  child: SvgPicture.asset(
                                    'assets/images/icon_search.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          border: InputBorder.none,
                          hintText: 'Enter Location',
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.80),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SearchResultsWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResultsWidget extends ConsumerWidget {
  const SearchResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchLocationProvider);
    return Expanded(
      child: switch (searchProvider) {
        AsyncData(:final value) => value.locations.isEmpty
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
                              ref.watch(
                                  currentWeatherProvider(location.id).future);

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
        _ => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Searching...',
                style: kBoldFont.copyWith(fontSize: 18),
              )
            ],
          ),
      },
    );
  }
}
