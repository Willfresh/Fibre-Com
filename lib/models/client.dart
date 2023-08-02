import 'package:flutter/material.dart';
class Client {
  String nom ;
  String prenom ;
  String nationalite ;
  String dateNaissance;
  String domaineActivite;
  String numeroTelephone;
  String email;
  String piecIdentite;
  String numeroPieceIdentite;
  String datePieceIdentite;
  String quartier;
  String ville;
  String offre;
  String modePaiement;
  String engaPaiement;
  String selectedDebi;
  String latitude;
  String longitude;

  Client({required this.nom,
    required this.prenom,
    required this.nationalite,
    required this.dateNaissance,
    required this.domaineActivite,
    required this.numeroTelephone,
    required this.email,
    required this.piecIdentite,
    required this.numeroPieceIdentite,
    required this.datePieceIdentite,
    required this.quartier,
    required this.ville,
    required this.offre,
    required this.modePaiement,
    required this.engaPaiement,
    required this.selectedDebi,
    required this.latitude,
    required this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'nationalite': nationalite,
      'dateNaissance': dateNaissance,
      "domaineActivite" : domaineActivite,
      'numeroTelephone': numeroTelephone,
      'email' : email,
      'pieceIdentite': piecIdentite,
      "numeroPieceIdentite": numeroPieceIdentite,
      "datePieceIdentite": datePieceIdentite,
      "quartierResidence": quartier,
      "ville": ville,
      "offre": offre,
      "modePaiement": modePaiement,
      "engagementPaiement": engaPaiement,
      "debit": selectedDebi,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
