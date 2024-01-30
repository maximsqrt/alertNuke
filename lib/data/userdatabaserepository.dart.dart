import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // Speichere weitere Benutzerdaten in der Datenbank
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}


//// Username 
/// UserID
/// ProfileImage
/// active state
/// phone 
/// email 
/// group ID
/// 
/// // create noch auth_repositor
/// 
/// firebase Repo erstellen !!! 