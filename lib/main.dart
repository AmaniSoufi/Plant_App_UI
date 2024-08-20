import 'package:flutter/material.dart';
import 'package:untitled7/fetures/home/details_screen.dart';
import 'package:untitled7/fetures/home/home_screen.dart';
import 'package:untitled7/fetures/home/prodect_model.dart';
import 'package:untitled7/fetures/onboarding/on_boarding_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingScreen(),
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}
