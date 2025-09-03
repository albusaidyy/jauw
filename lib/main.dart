import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/home_screen/home_screen.dart';

void main() async {
  // Initialize the locale data
  await initializeDateFormatting();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    DevicePreview(
      enabled:
          defaultTargetPlatform != TargetPlatform.android &&
          defaultTargetPlatform != TargetPlatform.iOS,
      devices: [Devices.ios.iPhone13ProMax],
      isToolbarVisible: false,
      backgroundColor: Colors.black87,
      builder: (context) {
        return const ProviderScope(child: MainApp());
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jauw',
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
