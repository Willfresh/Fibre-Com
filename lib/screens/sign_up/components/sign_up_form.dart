import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../service/FirebaseMessagingService.dart';
import '../../../service/auth.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../../welcome/welcome_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SignUpForm extends StatefulWidget{

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>{
  void handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.value.text;
    final password = _passwordController.value.text;

    setState(() {
      _loading = true;
    });

    UserCredential? userCredential = await AuthService().registerWithEmailAndPassword(email, password);

    if (userCredential != null) {
      final userId = userCredential.user!.uid;
      // Enregistrer les autres données dans la collection "users"
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'userId':userId,
        'nom': _nomController.text,
        'prenom': _prenomController.text,
        'email': email,
        'phoneNumber': _phoneNumberController.text,
      });
      // Initialiser Firebase Messaging Service
      FirebaseMessagingService().initialize(context);

      // Redirection vers une autre page après l'inscription réussie
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    } else {
      // Afficher un message d'erreur à l'utilisateur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite lors de l\'inscription')),
      );
    }

    setState(() {
      _loading = false;
    });
  }





  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false; // Indicateur de visibilité du mot de
  bool _loading =false;
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
        child: Column(
          children: [
            buildLNameFormField(),
            SizedBox(height: getProportionateScreenHeight(15),),
            buildNameFormField(),
            SizedBox(height: getProportionateScreenHeight(15),),
            buildEmailTextFormField(),
            SizedBox(height: getProportionateScreenHeight(15),),
            buildPasswordFormField(),
            //FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(15),),
            buildphoneFormField(),
            SizedBox(height: getProportionateScreenHeight(15),),
            SizedBox(
              width: getProportionateScreenWidth(400),
              height: getProportionateScreenHeight(56),
              child: ElevatedButton(
                  onPressed:() => handleSubmit(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: kPrimaryColor,
                ),
                  child: _loading? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                  ):Text("S'inscrire",style: TextStyle(
                      fontSize: getProportionateScreenWidth(38),
                      color: Colors.white),),),
              ),
          ],
        ),
      ),
    );
  }


  Container buildPasswordFormField() {
    return Container(
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
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          labelText: 'Mot de passe',
          suffixIcon: IconButton(
            icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
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
            return 'Veuillez entrer votre mot de passe';
          }
          return null;
        },
      ),
    );
  }
  Container buildEmailTextFormField() {
    return Container(
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
        validator: (value){
          if (value!.isEmpty) {
            return 'L\'adresse e-mail est requise';
          } else if (!value.contains('@')) {
            return 'Adresse e-mail invalide';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Email",
          suffixIcon: IconButton(
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
    );
  }
  Container buildLNameFormField() {
    return Container(
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
        validator: (value){
          if (value == null || value.isEmpty){
            return "Veuillez entrer votre nom";
          }
          return null;
        },
        decoration:  InputDecoration(
          labelText: "Nom",
          suffixIcon: IconButton(
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
    );
  }

  Container buildNameFormField() {
    return Container(
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
        validator: (value){
          if (value == null || value.isEmpty){
            return "Veuillez entrer votre prenom";
          }
          return null;
        },
        decoration:  InputDecoration(
          labelText: "Prénom",
          suffixIcon: IconButton(
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
    );
  }
  Container buildphoneFormField() {
    return Container(
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
        validator: (value){
          if (value == null || value.isEmpty){
            return "Le numéro est requis";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Numéro",
          suffixIcon: IconButton(
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
    );
  }
}


