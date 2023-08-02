import 'package:fibre_com/models/client.dart';
import 'package:fibre_com/components/succes_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibre_com/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart ';
import '../../size_config.dart';
import 'package:location/location.dart';

class OffreClient extends StatefulWidget{
  static String routeName= "/offre";

  final Client client;
  OffreClient({required this.client});


  @override
  State<OffreClient> createState() => _OffreClientState();
}

class _OffreClientState extends State<OffreClient> {

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _quartierController = TextEditingController();
  final _villeController = TextEditingController();
  final _offreController = TextEditingController();
  String _modePay = '';
  String _engaPay = '';
  final _debitList = [
    {"label": "50Mb/s", "value": "50"},
    {"label": "100Mb/s", "value": "100"},
    {"label": "200Mb/s", "value": "200"},
    {"label": "250Mb/s", "value": "250"},
    {"label": "300Mb/s", "value": "300"},
    {"label": "350Mb/s", "value": "350"},
    {"label": "400Mb/s", "value": "400"}
  ];
  String? _selectedDebi;
  final _location = Location();
  late LocationData _currentLocation;
  final _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    //try {
      _currentLocation = await _location.getLocation();
    /*} catch (e) {
      _currentLocation = null;
    }*/
    if (_currentLocation != null) {
      _controller.text =
      "${_currentLocation.latitude}, ${_currentLocation.longitude}";
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              Text("Offre et paiement",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(40),
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: SizeConfig.screenHeight! * 0.02,),
              Text("Veuillez fournir les informations conernant la localisation et l'offre",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.02,),//8% de la hauteur totale
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 3,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _quartierController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: 'Quartier',
                                //labelStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.location_city, /*color: Colors.black*/),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez entrer le quartier';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 3,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _villeController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: 'Ville',
                                //labelStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.location_city, /*color: Colors.black*/),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Veuillez saisir la ville';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 3,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _offreController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: 'Offre',
                                //labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Veuillez entrer l'offre";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 3,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: DropdownButton(
                              hint: Text(
                                "Débit",
                                style: TextStyle(color: Colors.black),
                              ),
                              value: _selectedDebi,
                              onChanged: (val) {
                                setState(() {
                                  _selectedDebi = val as String;
                                });
                              },
                              style: TextStyle(color: Colors.black),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.red,
                              ),
                              items: _debitList
                                  .map((item) => DropdownMenuItem(
                                child: Text(item["label"]!),
                                value: item["value"],
                              ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text('Mode de paiement',style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'Prépayé',
                              groupValue: _modePay,
                              onChanged: (value) {
                                setState(() {
                                  _modePay = value!;
                                });
                              },
                            ),
                            Text('Prépayé'),
                          ],
                        ),
                        SizedBox(width: 55,),
                        Row(
                          children: [
                            Radio(
                              value: 'Postpayé',
                              groupValue: _modePay,
                              onChanged: (value) {
                                setState(() {
                                  _modePay = value!;
                                });
                              },
                            ),
                            Text('Postpayé'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text('Engagement de paiement',style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'Annuelle',
                              groupValue: _engaPay,
                              onChanged: (value) {
                                setState(() {
                                  _engaPay = value!;
                                });
                              },
                            ),
                            Text('Annuelle'),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Row(
                          children: [
                            Radio(
                              value: 'Mensuelle',
                              groupValue: _engaPay,
                              onChanged: (value) {
                                setState(() {
                                  _engaPay = value!;
                                });
                              },
                            ),
                            Text('Mensuelle'),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: getProportionateScreenHeight(35),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Coordonnées de la position actuelle",
                          //labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.location_on, /*color: Colors.black*/),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Center(
                      child: ElevatedButton(
                        onPressed: _getCurrentLocation,
                        child: Text("Localisation actuelle"),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(50),),
                    Center(
                        child: Text("En appuyant sur Souscrire vous acceptez les termes et conditions d'utilisation",textAlign: TextAlign.center,)),
                    SizedBox(height: getProportionateScreenHeight(3),),
                    Padding(
                      padding: EdgeInsets.only(left:70,right:70,bottom: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Ajouter les données supplémentaires au client
                            widget.client
                              ..quartier = _quartierController.text
                              ..ville = _villeController.text
                              ..offre = _offreController.text
                              ..modePaiement = _modePay
                              ..engaPaiement = _engaPay
                              ..selectedDebi = _selectedDebi!
                              ..latitude = _currentLocation.latitude.toString()
                              ..longitude = _currentLocation.longitude.toString();

                            setState((){
                              isLoading = true;
                            });
                            // Enregistrer les données du client dans Cloud Firestore
                            final firestore = FirebaseFirestore.instance;
                            final user = FirebaseAuth.instance.currentUser;

                            if (user != null) {
                              final docRef = firestore.collection('clients').doc(user.uid);
                              Map<String, dynamic> clientData = widget.client.toMap();
                              clientData['infoClienId'] = user.uid; // Ajouter l'ID de l'utilisateur ici

                              await docRef.set(clientData);
                            }
                            setState((){
                              isLoading = false;
                            });
                            Navigator.pushNamed(context, SuccessScreen.routeName);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size(double.infinity, 50),
                          primary: kPrimaryColor,
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : Text(
                          "Souscrire",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(38),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


