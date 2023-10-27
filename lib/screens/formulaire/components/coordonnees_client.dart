import 'package:fibre_com/screens/formulaire/components/offre_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../models/client.dart';
import '../../constants.dart ';
import '../../size_config.dart';






class CoordonneesClient extends StatefulWidget {
  @override
  _CoordonneesClientState createState() => _CoordonneesClientState();
}

class _CoordonneesClientState extends State<CoordonneesClient> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _nationaliteController = TextEditingController();
  final _dateNaissanceController = TextEditingController();
  final _domaineActiviteController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emailController = TextEditingController();
  String _carteIdentiteType = '';
  final _carteIdentiteNumController = TextEditingController();
  final _carteIdentiteDateController = TextEditingController();
  Client client = Client(
      nom: 'nom',
      prenom: 'prenom',
      nationalite: 'nationalité',
      dateNaissance: 'dateNaissance',
      domaineActivite: "domaineActivite",
      numeroTelephone: 'numeroTelephone',
      email: 'email',
      piecIdentite: 'pieceIdentite',
      numeroPieceIdentite: "numeroPieceIdentite",
      datePieceIdentite: "datePieceIdentite",
      quartier: 'quartierResidence',
      ville: 'ville',
      offre: 'offre',
      modePaiement: 'modePaiement',
      engaPaiement: 'engagementPaiement',
      selectedDebi: 'debit',
      latitude: 'latitude',
      longitude: 'longitude');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom et prénom sur la même ligne
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
                              //blurRadius: 3,
                              //offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _nomController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Nom',
                            //labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.person, /*color: Colors.black*/),
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
                              return 'Veuillez saisir votre nom';
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
                              //blurRadius: 3,
                              //offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _prenomController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Prénom',
                            //labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.account_circle_rounded, /*color: Colors.black*/),
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
                              return 'Veuillez saisir votre prénom';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        //blurRadius:3,
                        //offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _dateNaissanceController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Date de naissance',
                      //labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today, /*color: Colors.black*/),
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            locale: LocaleType.fr, // Langue du calendrier
                            onConfirm: (date) {
                              _dateNaissanceController.text = DateFormat('dd/MM/yyyy').format(date); // Mettre à jour la valeur du champ de la date
                            },
                          );
                        },
                      ),
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
                        return 'Veuillez entrer votre date de naissance';
                      }
                      return null;
                    },
                  ),
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
                              //blurRadius: 3,
                              //offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _nationaliteController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Nationalité',
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
                              return 'Veuillez saisir votre nationalité';
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
                              //blurRadius: 3,
                              //offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _domaineActiviteController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Profession',
                            //labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.work, /*color: Colors.black*/),
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
                              return 'Veuillez saisir votre profession';
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
                              //blurRadius: 3,
                              //offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _telephoneController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Numéro de téléphone',
                            //labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.phone, /*color: Colors.black*/),
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
                              return 'Veuillez saisir votre numéro de téléphone';
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
                              //blurRadius: 3,
                              //offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            //labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.email_outlined, /*color: Colors.black*/),
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
                              return 'Veuillez saisir votre email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Choisissez votre pièce d\'identité',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Carte d\'identité',
                          groupValue: _carteIdentiteType,
                          onChanged: (value) {
                            setState(() {
                              _carteIdentiteType = value!;
                            });
                          },
                        ),
                        Text('Carte d\'identité'),
                      ],
                    ),
                    //SizedBox(width: 50,),
                    Row(
                      children: [
                        Radio(
                          value: 'Passeport',
                          groupValue: _carteIdentiteType,
                          onChanged: (value) {
                            setState(() {
                              _carteIdentiteType = value!;
                            });
                          },
                        ),
                        Text('Passeport'),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Carte d\'électeur',
                      groupValue: _carteIdentiteType,
                      onChanged: (value) {
                        setState(() {
                          _carteIdentiteType = value!;
                        });
                      },
                    ),
                    Text('Carte d\'électeur'),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        //blurRadius: 3,
                        //offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _carteIdentiteNumController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Numéro de la carte',
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
                        return 'Veuillez saisir le numéro';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        //blurRadius: 3,
                        //offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _carteIdentiteDateController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Date de delivrement',
                      //labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today, /*color: Colors.black*/),
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            locale: LocaleType.fr, // Langue du calendrier
                            onConfirm: (date) {
                              _carteIdentiteDateController.text = DateFormat('dd/MM/yyyy').format(date); // Mettre à jour la valeur du champ de la date
                            },
                          );
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10),
                        //borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre date de naissance';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        client.nom = _nomController.text;
                        client.prenom =_prenomController.text;
                        client.nationalite = _nationaliteController.text;
                        client.dateNaissance= _dateNaissanceController.text;
                        client.domaineActivite = _domaineActiviteController.text;
                        client.numeroTelephone= _telephoneController.text;
                        client.email= _emailController.text;
                        client.piecIdentite= _carteIdentiteType;
                        client.numeroPieceIdentite= _carteIdentiteNumController.text;
                        client.datePieceIdentite= _carteIdentiteDateController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OffreClient(
                              client: client,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      primary: kPrimaryColor,
                    ),
                    child:Text("Continuer",style: TextStyle(
                        fontSize: getProportionateScreenWidth(38),
                        color: Colors.white),),
                  ),
                )
              ]
          )
      ),
    );
  }
}


