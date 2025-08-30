import 'package:flutter/material.dart';
import 'package:event_planning_app/core/utils/theme/app_colors.dart';
import 'package:event_planning_app/features/onboarding/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Planner App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.scaffoldBackground,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
