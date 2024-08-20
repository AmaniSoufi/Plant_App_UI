import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
  });
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: color),
    );
  }
}
