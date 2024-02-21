import 'package:alertnukeapp/features/authentication/presentation/login.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //UsermodelRepository 
      //When userdaten 
      home: LoginScreen(), // Hier kannst du den Wrapper oder eine andere Startseite festlegen
    );
  }
}