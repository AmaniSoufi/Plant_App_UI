import 'package:flutter/material.dart';

class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({
    super.key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.text,
  });
  final double height;
  final double width;
  final String image;
  final String title;
  final String subtitle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.2,
        ),
        SizedBox(height: height * 0.35, child: Image.asset(image)),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Text(subtitle),
        ),
        Text(text),
      ],
    );
  }
}
