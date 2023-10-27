import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/default_button.dart';
import '../../constants.dart ';
import '../../size_config.dart';
class Derangement extends StatefulWidget{
  static String routeName = "/derangement";
  @override
  State<Derangement> createState() => _DerangementState();
}

class _DerangementState extends State<Derangement>{
  bool _isLoading = false; // Ajout d'une variable pour suivre l'état de progression

  void handleSubmit() async {
    // Vérification des champs
    if (_formKey.currentState!.validate()) {
      // Récupération de l'utilisateur authentifié
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Mise à jour de l'état de progression
        setState(() {
          _isLoading = true;
        });

        // Création d'un nouveau document dans la collection 'derangement'
        DocumentReference docRef = FirebaseFirestore.instance.collection('derangement').doc(user.uid);
        String deranId = user.uid;
        // Récupération des valeurs des champs
        String nom = _nomController.text;
        String numero = _numeroController.text;
        String prenom = _prenomController.text;
        String numeroLigne = _numeroLigneController.text;
        String message = _messageController.text;

        try {
          // Enregistrement des données dans le document
          await docRef.set({
            'deranId':deranId,
            'nom': nom,
            'numero': numero,
            'message': message,
            'prenom': prenom,
            'numeroLigne': numeroLigne,
          });

          // Succès de l'enregistrement
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Données enregistrées avec succès.')),
          );

          // Réinitialisation des champs du formulaire
          _nomController.clear();
          _numeroController.clear();
          _messageController.clear();
          _prenomController.clear();
          _numeroLigneController.clear();
        } catch (e) {
          // Erreur lors de l'enregistrement
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erreur lors de l\'enregistrement des données : $e')),
          );
        }

        // Mise à jour de l'état de progression
        setState(() {
          _isLoading = false;
        });
      } else {
        // Utilisateur non authentifié
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Utilisateur non authentifié"))
        );
      }
    }
  }
  final _formKey = GlobalKey<FormState>();
  bool _loading =false;
  final _nomController = TextEditingController();
  final _numeroController = TextEditingController();
  final _messageController = TextEditingController();
  final _numeroLigneController = TextEditingController();
  final _prenomController = TextEditingController();
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
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/technicien_fibre_optique (1).jpeg',
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
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Dérangement",
                        textAlign:TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      SizedBox(height: 20),
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
                          controller: _nomController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Nom',
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
                              return 'Veuillez saisir votre nom';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
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
                          controller: _prenomController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Prenom',
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
                              return 'Veuillez saisir votre Prenom';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
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
                          controller: _numeroController,
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
                      SizedBox(height: 20),
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
                          controller: _numeroLigneController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Numéro de ligne',
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
                              return 'Veuillez saisir votre numéro de votre ligne';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
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
                          controller: _messageController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Méssage',
                            //labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.message, /*color: Colors.black*/),
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
                              return 'Veuillez saisir votre méssage';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : handleSubmit,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: kPrimaryColor,
                            minimumSize: Size(130, 50),
                          ),
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            switchInCurve: Curves.easeIn,
                            switchOutCurve: Curves.easeOut,
                            child: _isLoading
                                ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : Text(
                              'Envoyer',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}