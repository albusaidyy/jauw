import 'dart:ui';

import 'package:flutter/material.dart';

import '../search_screen/search_screen.dart';

class AddNewWidget extends StatelessWidget {
  const AddNewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 32, 120),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 4),
            child: Stack(children: [
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
              Positioned(
                top: 12,
                bottom: 11,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.white.withOpacity(0.80),
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add new',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.80),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
