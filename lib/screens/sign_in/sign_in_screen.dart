import 'package:fibre_com/screens/sign_in/components/body.dart';
import 'package:fibre_com/screens/welcome/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart ';
import '../welcome/welcome_screen.dart';


class SignInScreen extends StatelessWidget{
  static String routeName= "/sign_in";
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return Theme(
                data: Theme.of(context).copyWith(
              inputDecorationTheme: inputDecorationTheme(),
            ),
          child: Scaffold(
              body: Body(),
            ));
          }
        }
    );
  }

}
InputDecorationTheme inputDecorationTheme(){
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kPrimaryColor,width: 1.0),
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    //border: outlineInputBorder,
  );
}