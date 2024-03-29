import 'package:fibre_com/screens/welcome/components/resiDetail/silver.dart';
import 'package:flutter/material.dart';
import 'package:fibre_com/screens/welcome/components/body.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../components/default_button.dart';
import '../../../formulaire/formulaire_screen.dart';
import '../../../size_config.dart';
import 'Platinium.dart';

class GoldScreen extends StatefulWidget{
  static String routeName = "/gold";
  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Hero(
                tag: 'image2', // Utilisez le même tag que celui de l'image de départ
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/wifehusband.png',
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
                          top: MediaQuery.of(context).size.height * 0.05,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 26,
                        decoration: BoxDecoration(
                          /*boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3.0,
                                offset: Offset(0, 3.0)
                            )
                          ],*/
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFFFD700),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical:4),
                        child: Center(
                          child: Text(
                            'Gold',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.favorite_outline,
                        color: Color(0xFFFFD700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 2,
              width: 120,
              color: Colors.red,
            ),
            SizedBox(height: 30,),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.grey.withOpacity(0.1),
                ),
                height: 30,
                width: 140,
                //color: Colors.grey.withOpacity(0.2),
                child:Center(
                  child: Text('25 000 FCFA/Mois',
                    //textAlign: TextAlign.center,
                  ),
                )
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30),
              child: Text('Jusqu’à 100 Mbps + 3600 minutes d’appel vers fixe & 120 minutes d’appel vers mobile',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height:30),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('Autres offres',style: TextStyle(fontWeight: FontWeight.bold,),),
            ),
            SizedBox(height:10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:15),
              child: Container(
                height: 90,
                //width: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 90,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Hero(
                              tag: 'image1',
                              child: GestureDetector(
                                onTap: ()=> Navigator.pushNamed(context, SilverScreen.routeName),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset('assets/images/full-shot-smiley-woman-holding-laptop.jpg')
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:2),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Silver',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),),
                                SizedBox(height:2),
                                Text('15000 FCFA/MOIS',style: TextStyle(
                                    color: Colors.grey,fontSize: 12
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      //padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 90,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Hero(
                              tag: 'image3',
                              child: GestureDetector(
                                onTap: ()=> Navigator.pushNamed(context, PlatiniumScreen.routeName),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset('assets/images/manpc.png')
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:2),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Platinum',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),),
                                SizedBox(height:2),
                                Text('30000 FCFA/MOIS',style: TextStyle(
                                    color: Colors.grey,fontSize: 12
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            Center(
              child: DefaultButton(
                text: "Souscrire",
                press: () {
                  Navigator.pushNamed(context, FormulaireScreen.routeName);
                },
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
          ],
        ),
      ),
    );
  }
}


