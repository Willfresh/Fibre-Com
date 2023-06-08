import 'package:fibre_com/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:fibre_com/screens/welcome/components/body.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../formulaire/formulaire_screen.dart';
import '../notifications/notifications_screen.dart';
import '../size_config.dart';

class WelcomeScreen extends StatefulWidget{
  static String routeName = "/welcome";
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //0xFFFFFA05
      backgroundColor: Colors.grey[100],
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "FIBRE COM",
          //style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Navigator.pushNamed(context, ProfileScreen.routeName),
          ),
        ],
      ),*/
      body: Body(),
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
          selectedIndex: 0,
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






