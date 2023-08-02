import 'package:fibre_com/components/default_button.dart';
import 'package:fibre_com/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';
import '../../constants.dart';
import '../../../service/auth.dart';
import '../../size_config.dart';

class Body extends StatefulWidget{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool inLogin = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Hero(
                tag: 'image1', // Utilisez le même tag que celui de l'image de départ
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/inscrip.png',
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(42),
                            topRight: Radius.circular(42),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08,
                          left: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Revenir à l'écran précédent
                          },
                          child: SvgPicture.asset(
                            'assets/icons/arrow-left-svgrepo-com.svg',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.01,),
                    Text("Creer un compte",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(60),
                        fontWeight: FontWeight.bold,
                      ),),
                    Text("Completez les informations ou continuer avec les reseaux sociaux",
                      textAlign: TextAlign.center,),
                    SizedBox(height: SizeConfig.screenHeight! * 0.08,),//8% de la hauteur totale
                    SignUpForm(),
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
                          inLogin: inLogin,),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(30),),
                    Text("En continuant vous accepter nos termes et conditions d'utilisation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(28)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

