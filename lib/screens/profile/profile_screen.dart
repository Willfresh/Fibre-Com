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

      body: Body(),
    );
  }
}