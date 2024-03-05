import 'package:alertnukeapp/features/icons/presentation/iconselectionscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alertnukeapp/features/icons/data/icon_repository.dart';

class FirebaseIconRepository implements IconRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> addIconDataCollection(String userId, IconData iconData, String iconText, String iconDescription) async {
    try {
      // Convert IconData to a string representation
      String iconString = iconData.codePoint.toString();

      // Store the IconData string in Firestore user document
      await FirebaseFirestore.instance.collection('users').doc(userId).collection('iconData').add({
        'iconString': iconString,
        'iconText': iconText,
        'iconDescription': iconDescription,
      });
    } catch (e) {
      print('Error adding icon data collection: $e');
    }
  }

  @override
  Future<List<IconWithName>> getIcondataCollection(String userId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('iconData')
          .get();

      List<IconWithName> icons = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        IconData iconData = IconData(int.parse(data['iconString']), fontFamily: 'MaterialIcons');
        String iconText = data['iconText'];
        String iconDescription = data['iconDescription'];
        return IconWithName(name: iconText, icon: iconData);
      }).toList();

      return icons;
    } catch (e) {
      print('Error getting icon data collection: $e');
      return []; // Return an empty list in case of error
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }
}
