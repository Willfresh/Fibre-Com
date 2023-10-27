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
      Image.asset(
        'assets/images/logoFibrePlan de travail.png',
        height: getProportionateScreenWidth(200),
        width: getProportionateScreenWidth(200),
        //fit: BoxFit.cover,
      ),
      Text(
        "FIBRE COM",
        style: TextStyle(
          fontSize: getProportionateScreenWidth(48),
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top: 10, left: 25.0, right: 25.0, bottom: 0),
        child: Text(
          text,
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
