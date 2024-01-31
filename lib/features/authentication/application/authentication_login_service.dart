class AuthenticationLoginService {
  String? password;
  String? email;
  String? repeatPassword;

  // Future<bool> signUp() {
  //       //passwortvergleich, ob werte gesetzt sind
        
  // }

  // Future<bool> login(){
    
  // }
}


// Ist login Bool anlegen, static- weil sonst Objekt erzeugen 
// Damit es Global passt
// auf dem ENtry Point überüfen - zeig login an sonst den anderen. 

//CHeckbox: SecuresharePreference when daten vorhanden sind muss man nicht nochmal alles tippen 







// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

//   Future<User?> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       // Sign in the user with provided email and password
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
      
//       // Check if the signed-in user is allowed
//       if (await isUserAllowed(result.user!.uid)) {
//         return result.user; // Return the signed-in user if allowed
//       } else {
//         // Not allowed, sign out the user
//         await _auth.signOut();
//         return null;
//       }
//     } catch (e) {
//       // If sign-in fails, return null
//       print('Error signing in: $e');
//       return null;
//     }
  

//   Future<bool> isUserAllowed(String userId) async {
//     try {
//       // Query Firestore to check if the user is allowed based on their ID
//       DocumentSnapshot snapshot = await _usersCollection.doc(userId).get();
//       return snapshot.exists; // Return true if user exists (allowed), otherwise false
//     } catch (e) {
//       print('Error checking user: $e');
//       return false;
//     }
//   }

//   Future<User?> registerWithEmailAndPassword(String email, String password) async {
//     // Implement registration logic if needed
//   }

//   // Method to sign out the current user
//   Future<void> signOut() async {
//     await _auth.signOut(); // Call Firebase Auth method to sign out the current user
//   }
// }
