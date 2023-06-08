import 'dart:async';
import 'package:fibre_com/screens/forgot_password/forgot_password_screen.dart';
import 'package:fibre_com/screens/formulaire/components/mapScreen.dart';
import 'package:fibre_com/screens/formulaire/components/offre_client.dart';
import 'package:fibre_com/screens/formulaire/formulaire_screen.dart';
import 'package:fibre_com/screens/notifications/notifications_screen.dart';
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
import 'package:fibre_com/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fibre_com/screens/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/client.dart';
import 'components/succes_screen.dart';
import 'firebase_options.dart';
import 'models/payment/payement_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fibre Com',
      theme: theme(),
      home: WaitingScreen(),
      routes: {
        //'/map': (context) => MapScreen(),
        '/offre': (context) => OffreClient(client: Client(
            nom: 'nom',
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
        '/welcome': (context) => WelcomeScreen(),
        '/payment': (context) => PaymentScreen(),
        '/gold': (context) => GoldScreen(),
        '/silver': (context) => SilverScreen(),
        '/platinium': (context) => PlatiniumScreen(),
        '/spllash': (context) => SplashScreen(),
        '/pro': (context) => ProScreen(),
        '/prosmall': (context) => ProSmallScreen(),
        '/proplus': (context) => ProPlusScreen(),
        '/sign_in': (context) => SignInScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/procyber': (context) => ProCyberScreen(),
        '/success': (context) => SuccessScreen(),
        '/profile': (context) => ProfileScreen(),
        '/formulaire' : (context) => FormulaireScreen(),
        '/notification' : (context) => NotificationScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen()
      },
    );
  }
}

class WaitingScreen extends StatefulWidget {
  final String text;

  WaitingScreen({this.text = 'FIBRE COM'});

  @override
  WaitingScreenState createState() => WaitingScreenState();
}

class WaitingScreenState extends State<WaitingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    Future.delayed(Duration(seconds: 3)).then((value) {
      // Rediriger l'utilisateur vers la page d'accueil correspondante
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        Navigator.pushReplacementNamed(context, '/welcome');
      } else {
        Navigator.pushReplacementNamed(context, '/spllash');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 1),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.scale(
                    scale: value,
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontFamily: 'Monoton',
                        color: Colors.red,
                        fontSize: 45,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 120),
              SpinKitSpinningLines(
                color: Colors.red,
                size: 70.0,
                controller: _animationController,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void activate() {
    super.activate();
  }
}






