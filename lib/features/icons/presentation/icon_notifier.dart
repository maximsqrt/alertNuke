// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class FirebaseIconController extends ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<String?> getCurrentUserId() async {
//     return _auth.currentUser?.uid;
//   }

//   Future<void> addIconDataCollection(String userId, IconData iconData, String iconText) async {
//     try {
//       // Convert IconData to a string representation
//       String iconString = iconData.codePoint.toString();

//       print('userID: $userId');
//       print('IconData: $iconString');
//       print('iconText: $iconText');

//       // Store the IconData string in Firestore user document
//       await FirebaseFirestore.instance.collection('users').doc(userId).collection('iconData').add({
//         'iconString': iconString,
//         'iconText': iconText,
//       });
//     } catch (e) {
//       print('Error adding icon data collection: $e');
//     }
//   }
// }
