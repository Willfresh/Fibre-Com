import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/notifications/notifications_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {


  Future<void> initialize(BuildContext context) async {
    // Demander l'autorisation de recevoir des notifications push
    await FirebaseMessaging.instance.requestPermission();

    // Écouter les notifications push lorsque l'application est en premier plan
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Gérez ici les notifications push entrantes
      // Vous pouvez afficher une notification ou effectuer d'autres actions en fonction du contenu du message
      if (message.notification != null) {
        // Récupérez les informations de la notification
        String title = message.notification!.title!;
        String body = message.notification!.body!;

      }
    });

    // Obtenir le jeton d'inscription FCM
    String? token = await FirebaseMessaging.instance.getToken();

    if (token != null) {
      // Obtenez l'ID de l'utilisateur actuellement connecté
      String getCurrentUserId() {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          String userId = user.uid;
          return userId;
        }
        // Gérer le cas où aucun utilisateur n'est connecté
        // Par exemple, vous pouvez retourner une valeur par défaut ou afficher une erreur
        return "";
      }

      String userId = getCurrentUserId();
      FirebaseFirestore db = FirebaseFirestore.instance;
      DocumentReference userRef = db.collection("users").doc(userId);
      userRef.update({"fcmToken": token}).then((value) {
        // Le jeton a été mis à jour avec succès dans la collection "users"
        // Vous pouvez ajouter ici d'autres actions ou afficher un message de succès si nécessaire
      }).catchError((error) {
        // Une erreur s'est produite lors de la mise à jour du jeton dans la collection "users"
        // Vous pouvez ajouter ici d'autres actions ou afficher un message d'erreur si nécessaire
      });
    }

  }

}
