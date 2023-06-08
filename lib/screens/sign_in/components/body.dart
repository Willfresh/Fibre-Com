import 'package:fibre_com/components/default_button.dart';
import 'package:fibre_com/screens/constants.dart';
import 'package:fibre_com/screens/forgot_password/forgot_password_screen.dart';
import 'package:fibre_com/screens/sign_in/components/sign_form.dart';
import 'package:fibre_com/screens/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';
import '../../services/auth.dart';

class Body extends StatefulWidget{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool inLogin = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.04,),
                  Container(
                    child: Image.asset(
                      'assets/images/workplace.png',
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                  //SizedBox(height: SizeConfig.screenHeight! * 0.04,),
                  Text("Connexion",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(60),
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("Connectez vous avec votre email et mot de passe",
                  textAlign: TextAlign.center,),
                  SizedBox(height: SizeConfig.screenHeight! * 0.08,),
                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight! * 0.08,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: 'assets/icons/google-color-svgrepo-com.svg',
                        press: (){},
                        inLogin: inLogin,
                        /*press: () {
                          setState(() {
                            inLogin = true;
                          });
                          AuthService().signInWithGoogle().then((result) {
                            setState(() {
                              inLogin = false;
                            });
                          }).catchError((error) {
                            setState(() {
                              inLogin = false;
                            });
                            // Gérer l'erreur ici
                          });
                        },
                        inLogin: inLogin, */// Passer inLogin ici
                      ),
                      SocialCard(
                        icon: "assets/icons/twitter-1-svgrepo-com.svg",
                        press: (){},
                        inLogin: inLogin,),
                      SocialCard(
                        icon: "assets/icons/facebook-option-svgrepo-com.svg",
                        press: (){},
                        inLogin: inLogin,)
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(40),),
                  NoAcountText(),
                  SizedBox(height: getProportionateScreenHeight(10),),
                ],
              ),
            ),
          ),
        ));
  }
}










