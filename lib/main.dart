// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies/components/bottom_bar.dart';

import 'package:foodies/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodies',
      routes: {
        'Home': (context) => const BottomBar(),
        'Onboarding': (context) => const OnboardingScreen(),
      },
      initialRoute:
          initScreen == 0 || initScreen == null ? "Home" : "Onboarding",
      debugShowCheckedModeBanner: false,
    );
  }
}
