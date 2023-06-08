import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../../welcome/welcome_screen.dart';

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
      // Enregistrement des autres données dans la collection "users"
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'nom': _nomController.text,
        'prenom': _prenomController.text,
        'email': email,
        'phoneNumber': _phoneNumberController.text,
      });

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


  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible, // Camouflage du mot de passe si _isPasswordVisible est false
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility), // Utilisation d'icônes différentes en fonction de la visibilité
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible; // Inversion de la visibilité du mot de passe lors de l'appui sur l'icône
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Veuillez entrer votre mot de passe';
        }
        return null;
      },
    );
  }
  TextFormField buildEmailTextFormField() {
    return TextFormField(
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
      decoration:  InputDecoration(
          labelText: "Email",
        suffixIcon: IconButton(
          icon: Icon(Icons.email_outlined), onPressed: () {  }, // Utilisation d'icônes différentes en fonction de la visibilité
        ),
      ),
    );
  }
  TextFormField buildLNameFormField() {
    return TextFormField(
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
            icon: Icon(Icons.person), onPressed: () {  }, // Utilisation d'icônes différentes en fonction de la visibilité
          ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: _prenomController,
      validator: (value){
        if (value == null || value.isEmpty){
          return "Le prénom est requis";
        }
        return null;
      },
      decoration:  InputDecoration(
          labelText: "Prénom",
        suffixIcon: IconButton(
          icon: Icon(Icons.person), onPressed: () {  },
        ),
      ),
    );
  }
  TextFormField buildphoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _phoneNumberController,
      validator: (value){
        if (value == null || value.isEmpty){
          return "Le numéro est requis";
        }
        return null;
      },
      decoration:  InputDecoration(
          labelText: "Numéro",
        suffixIcon: IconButton(
          icon: Icon(Icons.phone), onPressed: () {  }, // Utilisation d'icônes différentes en fonction de la visibilité
        ),
      ),
    );
  }
}


