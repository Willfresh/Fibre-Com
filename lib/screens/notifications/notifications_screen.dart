import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../formulaire/formulaire_screen.dart';
import '../welcome/welcome_screen.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "/notification";
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text("Pas de notifications"),
      ),
      bottomNavigationBar: NavigationBar(context),
    );
  }
}


Widget NavigationBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: GNav(
          selectedIndex: 2,
          activeColor: Colors.yellow,
          rippleColor: Colors.black, // Couleur pour les icônes désactivées
          tabBackgroundColor: Colors.grey.shade600,
          color: Colors.black,
          backgroundColor: Colors.transparent,
          gap: 8,
          padding: EdgeInsets.all(3),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Offre',
              iconSize: 18,
              textStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, WelcomeScreen.routeName),
            ),
            GButton(
              icon: Icons.edit_note,
              text: 'Formulaire',
              iconSize: 18,
              textStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, FormulaireScreen.routeName),
            ),
            GButton(
              icon: Icons.notifications,
              iconSize: 18,
              text: 'Notifications',
              textStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, NotificationScreen.routeName),
            ),
          ],
        ),
      ),
    ),
  );
}






