import 'package:alertnukeapp/application/FirebaseUserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationLoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _instance = FirebaseFirestore.instance;


  /*
    "name": "...",
    "email": "...",
    "benutzername": "...",
    "friends": [],


    _firestore.collection("users").doc(FirebaseUserData.userId).set({
      "name": "...",
    "email": "...",
    "benutzername": "...",
    "friends": [],
    })

   
  */

  // Method to sign in with email and password
Future<bool> signIn(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    if(userCredential.user != null){
      FirebaseUserData.userId = userCredential.user!.uid;
      final data = await _instance.collection("users").doc(userCredential.user!.uid).get();
      FirebaseUserData.email = data.data()!["email"];
      FirebaseUserData.username = data.data()!["username"];
      return true;
    }
    return false;
  } catch (e) {
    print(e);
    if (e is FirebaseAuthException && (e.code == 'user-not-found' || e.code == 'wrong-password')) {
      // Handle the case of invalid credentials
      return false;
    } else {
      // Handle other errors if needed
      return false;
    }
  }
}




  // Method to sign up with email and password
  Future<bool> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      // IN DB ANLEGE UNTER Sammlung USERS

      return userCredential.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Method to sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }


}

// Ist login Bool anlegen, static- weil sonst Objekt erzeugen 
// Damit es Global passt
// auf dem ENtry Point überüfen - zeig login an sonst den anderen. 

//CHeckbox: SecuresharePreference when daten vorhanden sind muss man nicht nochmal alles tippen 

