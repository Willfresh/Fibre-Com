import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../main.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn= GoogleSignIn();

  //Connexion avec google
  Future<UserCredential> signInWithGoogle() async {
    //Declencher le flux d'authentification
    final googleUser = await _googleSignIn.signIn();

    //Obtenir les détails d'autorisation de la demande
    final googleAuth = await googleUser!.authentication;

    //Creer un nouvel identifiant
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    //Une fois connecté, renvoyez l'identifiant de l'utilisateur
    return await _auth.signInWithCredential(credential);

  }

  //L'etat de l'utilisateur
  Stream <User?> get user => _auth.authStateChanges();

  Future<UserCredential?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  Future <void> signInWithEmailAndPassword(String email, String password) async{
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

}