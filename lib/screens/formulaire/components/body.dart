import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';
import 'coordonnees_client.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02,),
          Text("Formulaire de souscription",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(40),
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: SizeConfig.screenHeight! * 0.02,),
          Text("Veuillez fournir les informations personnelles ci-dessous",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02,),//8% de la hauteur totale
          CoordonneesClient(),
        ],
      ),
    );
  }
}