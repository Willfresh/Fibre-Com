import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPrimaryColor = Colors.red;//Color(0xE5FF0202);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E),Color(0xFFFF7643)],);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

const kSpacingUnit = 10;
const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFA2525);

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
final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  //fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  hintColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kLightSecondaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    //fontFamily: 'SFProText',
    bodyColor: kLightSecondaryColor,
    displayColor: kLightSecondaryColor,
  ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  //fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  hintColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
    color: kDarkSecondaryColor,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    //fontFamily: 'SFProText',
    bodyColor: kDarkSecondaryColor,
    displayColor: kDarkSecondaryColor,
  ),
);