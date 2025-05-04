import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/screens/onboarding.dart';

// Colors.
const Color accentColor = Color(0xFF7993AE);
const Color backgroundColor = Color(0xFFF5F5F5);
//const Color(0xFFF5F5F5)
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: backgroundColor,
      systemNavigationBarColor: backgroundColor,
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}
