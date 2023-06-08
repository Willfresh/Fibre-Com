import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        final phone = userData['phoneNumber'] ?? '';

        return SizedBox(
          height: 161,
          width: 161,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/istockphoto-1316420668-612x612.jpg"),
              ),
              Positioned(
                right: -10,
                bottom: -10,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Color(0xFFF5F6F9),
                      ),
                      onPressed: () {},
                      child: SvgPicture.asset("assets/icons/camera-svgrepo-com.svg"),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -55,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
