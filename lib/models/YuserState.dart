import 'package:flutter/foundation.dart';

class YuserState extends ChangeNotifier {
  String? _role; // Le rôle de l'utilisateur

  // Accesseur pour obtenir le rôle actuel de l'utilisateur
  String? get role => _role;

  // Méthode pour définir le rôle de l'utilisateur
  void setRole(String newRole) {
    _role = newRole;
    notifyListeners();
  }

  void signOut() {
    // Réinitialisez le rôle lorsque l'utilisateur se déconnecte
    _role = null;
    notifyListeners();
  }
}

/*
import 'package:flutter/foundation.dart';

import 'Yuser.dart';

class YuserState with ChangeNotifier {
  Yuser? _yuser;

  Yuser? get yuser => _yuser;

  void setYuser(Yuser yuser) {
    _yuser = yuser;
    notifyListeners();
  }

  String getRole() {
    return _yuser?.role ?? ''; // Retournez le rôle de l'utilisateur ou une chaîne vide par défaut.
  }

  void signOut() {
    _yuser = null;
    notifyListeners();
  }
}


*/
