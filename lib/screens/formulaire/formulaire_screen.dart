import 'package:fibre_com/screens/formulaire/components/body.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../notifications/notifications_screen.dart';
import '../size_config.dart';
import '../welcome/welcome_screen.dart';

class FormulaireScreen extends StatefulWidget {
  static String routeName = "/formulaire";
  @override
  State<FormulaireScreen> createState() => _FormulaireScreenState();
}

class _FormulaireScreenState extends State<FormulaireScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),

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
          selectedIndex: 1,
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






