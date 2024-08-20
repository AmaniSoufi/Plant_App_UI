import 'package:flutter/material.dart';
import 'package:untitled7/core/pallet.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.text,
  });

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.07,
      width: width,
      decoration: BoxDecoration(
          color: PrimaryColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
