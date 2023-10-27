import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart ';
import '/screens/welcome/homeScreen.dart';
import '../../size_config.dart';

class ModifScreen extends StatefulWidget {
  final String userId;

  ModifScreen({required this.userId});

  @override
  _ModifScreenState createState() => _ModifScreenState();
}

class _ModifScreenState extends State<ModifScreen> {
  late TextEditingController _nomController;
  late TextEditingController _prenomController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();

    // Initialize the text controllers with existing user data
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();

    getUserData();
  }

  Future<void> getUserData() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();

      if (userSnapshot.exists) {
        final userData = userSnapshot.data()!;
        _nomController.text = userData['nom'] ?? '';
        _prenomController.text = userData['prenom'] ?? '';
        _emailController.text = userData['email'] ?? '';
        _phoneNumberController.text = userData['phoneNumber'] ?? '';
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> updateUser() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
        'nom': _nomController.text,
        'prenom': _prenomController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneNumberController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Informations mises à jour avec succès')));
    } catch (e) {
      print("Error updating user data: $e");
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      /*appBar: AppBar(
        title: Text('Modifier le profil'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top:65,right: 25,left: 25,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(color:Colors.grey.withOpacity(0.05),
                        spreadRadius: 5,
                        blurRadius: 3,
                      )
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20,right: 5,left: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, HomeScreen.routeName);},
                              child: Icon(Icons.arrow_back_ios_sharp)),
                          Icon(Icons.more_vert)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image:DecorationImage(
                                  image: AssetImage("assets/images/istockphoto-1316420668-612x612.jpg"),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //width: (size.width-40)*0.6,
                            child: Column(
                              children: [
                                Text(
                                  'Profil utilisateur',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:15,right: 25,left: 25,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(color:Colors.grey.withOpacity(0.05),
                        spreadRadius: 5,
                        blurRadius: 3,
                      )
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 20),
                  child: Column(
                    children: [

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
                          keyboardType: TextInputType.text,
                          controller: _nomController,
                          decoration:  InputDecoration(
                            labelText: "Nom",
                            prefixIcon: IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {  },
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
                          keyboardType: TextInputType.text,
                          controller: _prenomController,
                          decoration:  InputDecoration(
                            labelText: "Prénom",
                            prefixIcon: IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {  },
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
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: IconButton(
                              icon: Icon(Icons.email_outlined),
                              onPressed: () {},
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
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            labelText: "Numéro",
                            prefixIcon: IconButton(
                              icon: Icon(Icons.phone),
                              onPressed: () {},
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
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Color(0xFFFDE2E2),
                            minimumSize: Size(double.infinity, 60),
                            //color: Color(),
                          ),
                          onPressed:updateUser,
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Expanded(
                                  child: Center(child: Text("ENREGISTRER",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),))
                              ),
                            ],
                          )
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
