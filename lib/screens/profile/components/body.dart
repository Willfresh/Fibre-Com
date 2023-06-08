import 'package:fibre_com/screens/constants.dart';
import 'package:fibre_com/screens/profile/components/profil_pic.dart';
import 'package:fibre_com/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/payment/payement_screen.dart';
import '../../notifications/notifications_screen.dart';



class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            /*height: 200,
            width: 350,
            color: Colors.red.withOpacity(0.5),*/
            child: ProfilePic(),

          ),
          SizedBox(height: 55,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileMenu(
                    icon: "assets/icons/notification-svgrepo-com.svg",
                    text: "Notification",
                    press: (){
                      Navigator.pushNamed(context, NotificationScreen.routeName);
                    },
                  ),
                  ProfileMenu(
                    icon: "assets/icons/settings-svgrepo-com.svg",
                    text: "Paramètres",
                    press: (){},
                  ),
                  ProfileMenu(
                    icon:"assets/icons/wallet-banknotes-svgrepo-com.svg",
                    text: "Paiement",
                    press: (){
                      Navigator.pushNamed(context, PaymentScreen.routeName);
                    },
                  ),
                  ProfileMenu(
                    icon: "assets/icons/help-circle-svgrepo-com.svg",
                    text: "Aide",
                    press: (){},
                  ),
                  ProfileMenu(
                    icon: "assets/icons/logout-svgrepo-com.svg",
                    text: "Deconnexion",
                    press: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, required this.text, required this.icon, required this.press,
  });
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:40,vertical:10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
          ),
          primary: Color(0xFFF5F6F9),
          minimumSize: Size(double.infinity, 60),
          //color: Color(),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(icon,width: 22,color: Colors.red,),
            SizedBox(width: 20,),
            Expanded(
                child: Text(text,style: TextStyle(color:Colors.black),)
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.red,)
          ],
        )
      ),
    );
  }
}

