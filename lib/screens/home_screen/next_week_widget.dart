import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/models/next_week_weather.dart';
import 'package:weather_app/utils/formart_utils.dart';

import '../../utils/constants.dart';

class NextWeekWidget extends StatelessWidget {
  const NextWeekWidget({
    super.key,
    required this.forecastDay,
  });

  final List<Forecastday> forecastDay;

  @override
  Widget build(BuildContext context) {
    // Get a sublist of forecastDay from index 8 to 12
    // List<Forecastday> sublist = forecastDay.sublist(8, 12);
    return Positioned(
      top: 635,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: forecastDay.asMap().entries.map((e) {
                    final int index = e.key;
                    return NextWeekItem(fDay: forecastDay[index]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextWeekItem extends StatelessWidget {
  const NextWeekItem({
    super.key,
    required this.fDay,
  });
  final Forecastday fDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          FormartUtils.formatDateOfWeek(fDay.dateEpoch),
          style: kRegularFont.copyWith(
            fontSize: 14,
            color: const Color(0xFFEBEBEB),
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
          width: 45,
          height: 40,
          child: Image.network('https:${fDay.day.condition.icon}'),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          '${fDay.day.avgtempC.toStringAsFixed(0)}\u00B0',
          style: kRegularFont.copyWith(
            fontSize: 16,
            color: const Color(0xFFEBEBEB),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          fDay.day.maxwindKph.toStringAsFixed(0),
          style: kRegularFont.copyWith(
            fontSize: 10,
            color: const Color(0xFFEBEBEB),
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
            color: const Color(0xFFEBEBEB),
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
    );
  }
}
