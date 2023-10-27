
import 'package:fibre_com/screens/formulaire/components/offre_client.dart';
import 'package:fibre_com/screens/profile/profile_screen.dart';
import 'package:fibre_com/screens/sign_in/sign_in_screen.dart';
import 'package:fibre_com/screens/sign_up/sign_up_screen.dart';
import 'package:fibre_com/screens/splash/splash_screen.dart';
import 'package:fibre_com/screens/welcome/components/entrepriseDetail/proCyber.dart';
import 'package:fibre_com/screens/welcome/components/entrepriseDetail/proPlus.dart';
import 'package:fibre_com/screens/welcome/components/profDetail/ProScreen.dart';
import 'package:fibre_com/screens/welcome/components/profDetail/prosmallScreen.dart';
import 'package:fibre_com/screens/welcome/components/resiDetail/Gold.dart';
import 'package:fibre_com/screens/welcome/components/resiDetail/Platinium.dart';
import 'package:fibre_com/screens/welcome/components/resiDetail/silver.dart';
import 'package:fibre_com/screens/welcome/homeScreen.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../models/client.dart';
import '../components/succes_screen.dart';
import '../models/payment/payement_screen.dart';
import 'forgot_password/forgot_password_screen.dart';
import 'package:fibre_com/screens/welcome/welcome_screen.dart';
import 'formulaire/components/derangement.dart';
import 'formulaire/components/mapScreen.dart';
import 'notifications/notifications_screen.dart';
import 'formulaire/formulaire_screen.dart';
import 'package:fibre_com/theme/theme_manager.dart';


final Map<String , WidgetBuilder> routes ={
  OffreClient.routeName: (context) => OffreClient(client: Client(nom: 'nom',
      prenom: 'prenom',
      nationalite: 'nationalité',
      dateNaissance: 'date de naissance',
      domaineActivite: "domaine d'activité",
      numeroTelephone: 'numéro de téléphone',
      email: 'email',
      piecIdentite: 'pièce d\'identité',
      numeroPieceIdentite: "numéro de la pièce didentité",
      datePieceIdentite: "date pièce d'identité",
      quartier: 'quartier de résidence',
      ville: 'ville',
      offre: 'offre',
      modePaiement: 'mode de paiement',
      engaPaiement: 'engagement de paiement',
      selectedDebi: 'debit',
      latitude: 'latitude',
      longitude: 'longitude')),
  SuccessScreen.routeName: (context) => SuccessScreen(),
  MapScreen.routeName: (context) => MapScreen(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  PlatiniumScreen.routeName: (context) => PlatiniumScreen(),
  SilverScreen.routeName: (context) => SilverScreen(),
  GoldScreen.routeName: (context) => GoldScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProScreen.routeName: (context) => ProScreen(),
  ProCyberScreen.routeName: (context) => ProCyberScreen(),
  ProPlusScreen.routeName: (context) => ProPlusScreen(),
  ProSmallScreen.routeName: (context) => ProSmallScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  FormulaireScreen.routeName: (context) => FormulaireScreen(),
  Derangement.routeName: (context) => Derangement(),
  HomeScreen.routeName: (context) => HomeScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),

};