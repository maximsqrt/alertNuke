import 'package:alertnukeapp/app.dart';
import 'package:alertnukeapp/config/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  // Initialisiere Firebase
  WidgetsFlutterBinding.ensureInitialized(); // Erforderlich für Firebase-Initialisierung
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Starte die Flutter-App
  runApp(App());
}







