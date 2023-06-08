import 'package:flutter/material.dart';
import 'package:fibre_com/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mot de passe oublié",
          style: TextStyle(color: Colors.grey[600],
              fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}