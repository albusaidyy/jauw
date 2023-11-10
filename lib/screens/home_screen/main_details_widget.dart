import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class MainDetailsWidget extends StatelessWidget {
  const MainDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 230,
      left: 119,
      right: 119,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 95,
            height: 95,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/icon_sunny.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'Sunny',
            style: kBoldFont.copyWith(shadows: [
              const Shadow(
                color: Color(0x3E000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ], fontWeight: FontWeight.w700, height: 0),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '33',
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
