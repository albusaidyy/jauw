import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/current_weather.dart';
import '../../utils/constants.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.wind,
    required this.mMain,
  });
  final Wind wind;
  final Mmain mMain;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 519,
      left: 24,
      right: 24,
      child: SizedBox(
        width: 345,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icon_humidity.svg',
                  width: 30,
                  height: 30,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'HUMIDITY',
                  style: kMediumFont.copyWith(
                    fontSize: 14,
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
                  height: 4,
                ),
                Text(
                  '${(mMain.humidity.toString())}\u0025',
                  style: kMediumFont.copyWith(
                    fontSize: 14,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icon_wind.svg',
                  width: 30,
                  height: 30,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'WIND',
                  style: kMediumFont.copyWith(
                    fontSize: 14,
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
                  height: 4,
                ),
                Text(
                  '${wind.speed}km/h',
                  style: kMediumFont.copyWith(
                    fontSize: 14,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icon_feels_like.svg',
                  width: 30,
                  height: 30,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'FEELS LIKE',
                  style: kMediumFont.copyWith(
                    fontSize: 14,
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
                  height: 4,
                ),
                Text(
                  '${mMain.feelsLike}\u00B0',
                  style: kMediumFont.copyWith(
                    fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}
