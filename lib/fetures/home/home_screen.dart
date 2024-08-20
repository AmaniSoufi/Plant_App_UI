import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled7/core/pallet.dart';
import 'package:line_icons/line_icons.dart';
import 'package:untitled7/fetures/home/cart_screen.dart';

import 'package:untitled7/fetures/home/ecommerce_home_screen.dart';
import 'package:untitled7/fetures/home/likes_screen.dart';
import 'package:untitled7/fetures/home/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      EcommerceHomeScreen(),
      LikesScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SecondryColor,
      bottomNavigationBar: GNav(
        haptic: true,
        tabBorderRadius: 30,
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 900),
        gap: 8,
        activeColor: PrimaryColor,
        iconSize: 26,
        tabBackgroundColor: Colors.green.withOpacity(0.1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        tabs: [
          GButton(
            icon: Icons.home,
            iconColor: Colors.grey,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.heartAlt,
            text: 'Likes',
            iconColor: Colors.grey,
          ),
          GButton(
            icon: Icons.shopping_cart,
            iconColor: Colors.grey,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.person,
            iconColor: Colors.grey,
            text: 'Profile',
          ),
        ],
        onTabChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: pages[selectedIndex],
    );
  }
}
