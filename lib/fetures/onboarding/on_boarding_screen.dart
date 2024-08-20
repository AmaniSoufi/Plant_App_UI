import 'package:flutter/material.dart';
import 'package:untitled7/core/custom_button_widget.dart';
import 'package:untitled7/core/pallet.dart';
import 'package:untitled7/fetures/onboarding/custom_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SecondryColor,
      body: Stack(
        children: [
          CustomPageView(
            height: height,
            width: width,
          ),
          Positioned(
            top: height * 0.1,
            right: 32,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/homescreen');
              },
              child: Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.2,
            left: width * 0.15,
            right: width * 0.15,
            child: CustomButtonWidget(
              height: height,
              width: width,
              text: 'Next',
            ),
          )
        ],
      ),
    );
  }
}
