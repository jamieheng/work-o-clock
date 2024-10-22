import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:work_o_clock/src/screens/splash_screen/splash_screen.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WORKO'CLOCK",
      theme: ThemeData(
        dialogBackgroundColor: Colors.transparent,
        fontFamily: 'Jost',
        textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 14),
          bodyMedium: TextStyle(fontSize: 16),
          headlineLarge: TextStyle(fontSize: 24),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: BaseColors.secondaryColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
