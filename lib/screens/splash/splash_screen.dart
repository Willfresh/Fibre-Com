import 'package:flutter/material.dart';
import 'package:fibre_com/screens/splash/components/Body.dart';
import 'package:fibre_com/screens/size_config.dart';
 class SplashScreen extends StatelessWidget{
   static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Body(),
    );
  }

 }