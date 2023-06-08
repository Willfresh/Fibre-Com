import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../profile/profile_screen.dart';


class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Image.asset(
                "assets/images/girlyellow.jpg",
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:50,right: 20,left:20 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'FIBRE COM',
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 110),
                      GestureDetector(
                        onTap: ()=>Navigator.pushNamed(context, ProfileScreen.routeName),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/girlyellow.jpg'),
                          radius: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Recherche',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14,  // Ajout de la taille de police pour le label
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),  // Réduction de l'espacement vertical
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,  // Ajout de la taille de police pour le texte saisi
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}