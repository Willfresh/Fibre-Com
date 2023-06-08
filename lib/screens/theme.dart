import 'package:flutter/material.dart';

import 'constants.dart ';

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