import 'package:fibre_com/screens/profile/profile_screen.dart';
import 'package:fibre_com/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants.dart ';
import '../notifications/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    WelcomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<GButton> tabs = [
      GButton(
        icon: Icons.home,
        text: 'Offre',
        //iconSize: 18,
        textStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      GButton(
        icon: Icons.notifications,
        text: 'Notifications',
        textStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      GButton(
        icon: Icons.account_circle,
        text: 'Compte',
        textStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      // Add more GButton widgets for additional tabs
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: GNav(
            tabs: tabs,
            selectedIndex: pageIndex,
            onTabChange: (index) {
              setTabs(index);
            },
            gap: 8,
            padding: EdgeInsets.all(3),
            backgroundColor: Colors.transparent,
            activeColor: Colors.black,
            rippleColor: Colors.black,
            iconSize: 18,
            tabBackgroundColor: Color(0xFFF5F5F5),
          ),
        ),
      ),
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

