import 'package:flutter/material.dart';

import '../../models/next_week_weather.dart';
import '../../utils/constants.dart';

class MainDetailsWidget extends StatelessWidget {
  const MainDetailsWidget({
    super.key,
    required this.wCurrent,
    // required this.value,
    // required this.mMain,
  });
  // final List<Weather> value;
  // final Mmain mMain;

  final Current wCurrent;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 248,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https:${wCurrent.condition.icon}'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            wCurrent.condition.text,
            style: kBoldFont.copyWith(shadows: [
              const Shadow(
                color: Color(0x3E000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ], fontWeight: FontWeight.w700, height: 0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wCurrent.tempC.toStringAsFixed(0),
                style: kMediumFont.copyWith(
                  fontSize: 86,
                  height: 0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\u00B0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color(0x3E000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          height: 0,
                          shadows: [
                            Shadow(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
