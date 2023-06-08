import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
    required this.inLogin, // nouveau paramètre
  }) : super(key: key);

  final String icon;
  final VoidCallback press;
  final bool inLogin; // nouveau champ

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!inLogin) { // Vérifier que inLogin est false avant d'appeler press()
          press();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenWidth(72),
        width: getProportionateScreenWidth(72),
        decoration: BoxDecoration(
          color:Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: inLogin
            ? CircularProgressIndicator(color: Colors.red, strokeWidth: 2,)
            : SvgPicture.asset(icon),
      ),
    );
  }
}