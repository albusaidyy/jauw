import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LocationListingWidget extends StatelessWidget {
  const LocationListingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const LocationItem();
        },
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
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
                            '33',
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
                                  'New York',
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
                                  'Sunny',
                                  style: kMediumFont.copyWith(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.80)),
                                )
                              ],
                            ),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/icon_sunny_56.png'),
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
                              '52\u0025',
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
                              '15km/h',
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
