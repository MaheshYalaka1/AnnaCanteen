import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:mahesh_map/home_page/Home_page.dart';
import 'package:mahesh_map/home_page/donation_page.dart';
import 'package:mahesh_map/home_page/nearLocation.dart';

class Tabbar_screen extends StatefulWidget {
  const Tabbar_screen({
    super.key,
  });

  @override
  State<Tabbar_screen> createState() => _home_pageState();
}

class _home_pageState extends State<Tabbar_screen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    LocationSelector(),
    DonetionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xfffff8f8),
        color: const Color(0xffE20736),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          Icon(
            Icons.currency_rupee,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}
