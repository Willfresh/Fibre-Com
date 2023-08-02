import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../welcome/welcome_screen.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final userData = snapshot.data!.data();
        final name = userData!['prenom'] ?? '';
        final Lname = userData['nom'] ?? '';
        final numeroTelephone = userData['numeroTelephone'] ?? '';

        return Container(
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
                          Navigator.pushNamed(context, WelcomeScreen.routeName);},
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width:5),
                              Text(
                                Lname,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(numeroTelephone,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }

}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final docRef = firestore.collection('users').doc(user!.uid);
  final snapshot = await docRef.get();
  return snapshot;
}
