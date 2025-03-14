import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/screens/app/home_screen.dart';
import 'package:lms/screens/app/inbox_screen.dart';
import 'package:lms/screens/app/myCourses_screen.dart';
import 'package:lms/screens/profile/profile_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    HomeScreen(),
    MyCoursesScreen(),
    InboxScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: WaterDropNavBar(
        iconSize: 28,
        bottomPadding: 8,
        waterDropColor: AppColors.buttonColor,
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        selectedIndex: _currentIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home_rounded,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: Icons.favorite_rounded,
            outlinedIcon: Icons.favorite_border_rounded,
          ),
          BarItem(
            filledIcon: Icons.message_rounded,
            outlinedIcon: Icons.message_outlined,
          ),
          BarItem(
            filledIcon: Icons.person_2,
            outlinedIcon: Icons.person_2_outlined,
          ),
        ],
      ),
    );
  }
}
