import 'package:flutter/material.dart';

const kPrimaryColor = Colors.red;//Color(0xE5FF0202);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E),Color(0xFFFF7643)],);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

// form error
final RegExp emailValidatorRegExp = RegExp(r"[a-zA-Z0-9.]+@[a-zA-Z0-9]+/.[a-zA-Z]+");
const String kEmailNullError = "S'il vous plait entrer votre email";
const String kInvalidEmailError = "Votre email n'est pas valide";
const String kPassNullError = "S'il vous plait entrer votre mot de passe";
const String kShortPassError = "Le mot de passe est trop court";
const String kMatchPassError = "Les mots de passe ne correspondent pas";
const String kNameNullError = "Les mots de passe ne correspondent pas";
//const String kError = "Les mots de passe ne correspondent pas";
//const String kError = "Les mots de passe ne correspondent pas";