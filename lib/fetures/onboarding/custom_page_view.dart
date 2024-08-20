import 'package:flutter/material.dart';
import 'package:untitled7/fetures/onboarding/custom_item_widget.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        CustomItemWidget(
          height: height,
          width: width,
          image:
              "images/Free Vector _ Environment concept illustration (1).jpg",
          title: "Shopping",
          subtitle: "Discover a wide variety of plants ",
          text: " that will beautify your home and garden",
        ),
        CustomItemWidget(
          height: height,
          width: width,
          image: "images/Free Vector _ Seeding concept illustration (8).jpg",
          title: "Explore Plant Varieties",
          subtitle: "Browse through our extensive ",
          text: " collection of plants,Find the perfect plant.",
        ),
        CustomItemWidget(
          height: height,
          width: width,
          image: "images/Free Vector _ Investing concept illustration (9).jpg",
          title: "Expert Advice",
          subtitle: "Get expert tips and advice ",
          text: "on plant care from our specialists.",
        )
      ],
    );
  }
}
