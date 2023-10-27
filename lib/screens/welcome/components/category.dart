import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../formulaire/formulaire_screen.dart';
import '../../size_config.dart';
import '../OfferedCard.dart';
import 'entreprise.dart';
import 'professionel.dart';
import 'resident.dart';

class Category extends StatefulWidget{
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey[100],

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0,-90),
              child: Column(
                children:[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Text('Offre résidentielle',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                  ),
                  Resident(),
                ]
              ),
            ),
            Transform.translate(
              offset: Offset(0,-50),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: OfferedCard(),
              ),
            ),
            Transform.translate(
              offset: Offset(0,-50),
              child: Column(
                children:[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Text('Offre professionelle',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                  ),
                  Professionel(),
                ]
              ),
            ),
            Transform.translate(
              offset: Offset(0,-10),
              child: Column(
                  children:[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Text("Offre d'entreprise",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),),
                    ),
                    Entreprise(),
                  ]
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10),),
          ],
        ),
      );
  }
}




