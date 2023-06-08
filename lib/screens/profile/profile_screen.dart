import 'package:flutter/material.dart';
import 'package:fibre_com/screens/profile/components/body.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),

      body: Body(),
    );
  }
}