import 'package:alertnukeapp/screens/login/login.dart';
import 'package:alertnukeapp/screens/wrapper.dart';
import 'package:alertnukeapp/screens/social/social.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  // Initialisiere Firebase
  WidgetsFlutterBinding.ensureInitialized(); // Erforderlich für Firebase-Initialisierung
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Starte die Flutter-App
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //UsermodelRepository 
      //When userdaten 
      home: LoginScreen(), // Hier kannst du den Wrapper oder eine andere Startseite festlegen
    );
  }
}


////firebase@1.com  Peterpan123!