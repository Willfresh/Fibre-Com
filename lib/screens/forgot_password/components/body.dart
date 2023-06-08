import 'package:fibre_com/screens/size_config.dart';
import 'package:flutter/material.dart';

import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
              Text("Mot de passe oublié",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(50),
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              ),
              Text("S'il vous plait entrer votre email et nous vous enverons un lien sur votre compte",
                  textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }

}

