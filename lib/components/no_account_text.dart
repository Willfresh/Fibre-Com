import 'package:flutter/material.dart';

import '../screens/constants.dart ';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';
import '../screens/size_config.dart';
class NoAcountText extends StatelessWidget {
  const NoAcountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Vous n'avez pas de compte ?",
          style: TextStyle(fontSize: getProportionateScreenWidth(30)),
        ),
        GestureDetector(
          onTap: ()=> Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text("Inscrivez vous",
            style: TextStyle(fontSize: getProportionateScreenWidth(30),
                color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}