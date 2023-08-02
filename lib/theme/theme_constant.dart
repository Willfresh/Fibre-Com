import 'package:flutter/material.dart';

import '../screens/constants.dart ';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Merriweather",
    //appBarTheme: appBarTheme(),
    primarySwatch: Colors.red,
    //textTheme: textTheme(),
    //inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

/*ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.red,
    fontFamily: "Merriweather",
  brightness: Brightness.light

);*/

/*ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.red,
    fontFamily: "Merriweather",
    brightness: Brightness.dark
);
final darkThemeData = ThemeData.dark().copyWith(
    brightness: Brightness.light
  // Personnalisez les propriétés du thème sombre si nécessaire
);

final lightThemeData = ThemeData.light().copyWith(
    brightness: Brightness.dark
  // Personnalisez les propriétés du thème clair si nécessaire
);*/

/*TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}*/

/*AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    //brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),

  );
}*/