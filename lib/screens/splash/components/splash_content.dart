import 'package:flutter/material.dart';
import 'package:fibre_com/screens/splash/components/Body.dart';
import 'package:fibre_com/screens/constants.dart';
import 'package:fibre_com/screens/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      Padding(
        padding:  EdgeInsets.only(top: 20.0),
        child: Text(
          "FIBRE COM",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(50),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top:15,left: 25.0,right: 25.0,bottom: 0),
        child: Text(text,
        textAlign: TextAlign.center,
        ),
      ),
      //Spacer(),
      Expanded(
        child: Image.asset(
          image,
          height: getProportionateScreenHeight(500),
          width: getProportionateScreenWidth(500),
        ),
      ),
    ]);
  }
}