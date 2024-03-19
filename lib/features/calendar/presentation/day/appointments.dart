import 'package:alertnukeapp/common/savediconsprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconAppointment {
  final IconWithName iconWithName;
  final DateTime appointmentDate;
  final String appointmentDescription;
  ///Optional für Apoinzments 
  final double? iconPosition;

  IconAppointment({
    required this.iconWithName,
    required this.appointmentDate,
    required this.appointmentDescription,
    this.iconPosition,
  });
}

abstract class IconRepository {
  Future<void> addIconAppointment(
      String userId, IconAppointment iconAppointment);
  Future<String?> getCurrentUserId();
}

class FirebaseIconAppointmentRepository implements IconRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> addIconAppointment(
      String userId, IconAppointment iconAppointment) async {
   final data = {
      
        
      'iconCodePoint': iconAppointment.iconWithName.icon.codePoint,
      'iconFontFamily': iconAppointment.iconWithName.icon.fontFamily,
      'iconFontPackage': iconAppointment.iconWithName.icon.fontPackage,
      'iconName': iconAppointment.iconWithName.name,
      'iconDescription': iconAppointment.iconWithName.iconDescription,
      'appointmentDate': iconAppointment.appointmentDate,
      'appointmentDescription': iconAppointment.appointmentDescription,
    };
      // Optional: Hinzufügen der Position, wenn sie vorhanden ist
  if (iconAppointment.iconPosition != null) {
    data['iconPosition'] = iconAppointment.iconPosition;
  }
  print( iconAppointment.iconPosition.toString());
   await _firestore
      .collection('users')
      .doc(userId)
      .collection('Appointments')
      .add(data);
  }

  @override
  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }
}
