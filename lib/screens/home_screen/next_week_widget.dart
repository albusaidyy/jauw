import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class NextWeekWidget extends StatelessWidget {
  const NextWeekWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 617,
      left: 24,
      right: 24,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 45),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.60,
                child: Container(
                  width: double.infinity,
                  height: 153,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF535353),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 19,
                right: 19,
                top: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Wed 16',
                          style: kRegularFont.copyWith(
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
                          height: 12,
                        ),
                        SizedBox(
                          width: 41,
                          height: 32,
                          child: Image.asset(
                            'assets/images/w_1.png',
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '22\u00B0',
                          style: kRegularFont.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '1-5',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
                          'km/h',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
                        Text(
                          'Thu 17',
                          style: kRegularFont.copyWith(
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
                          height: 12,
                        ),
                        SizedBox(
                          width: 41,
                          height: 32,
                          child: Image.asset(
                            'assets/images/w_2.png',
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '25\u00B0',
                          style: kRegularFont.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '1-5',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
                          'km/h',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
                        Text(
                          'Fri 18',
                          style: kRegularFont.copyWith(
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
                          height: 12,
                        ),
                        SizedBox(
                          width: 41,
                          height: 32,
                          child: Image.asset(
                            'assets/images/w_3.png',
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '23\u00B0',
                          style: kRegularFont.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '1-5',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
                          'km/h',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
                        Text(
                          'Sat 19',
                          style: kRegularFont.copyWith(
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
                          height: 12,
                        ),
                        SizedBox(
                          width: 41,
                          height: 32,
                          child: Image.asset(
                            'assets/images/w_4.png',
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '25\u00B0',
                          style: kRegularFont.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '1-5',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
                          'km/h',
                          style: kRegularFont.copyWith(
                            fontSize: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}
