import 'package:alertnukeapp/features/authentication/presentation/login.dart';
import 'package:alertnukeapp/features/icons/domain/firebase_image.dart';
import 'package:alertnukeapp/features/icons/domain/profilepictureprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfilePictureProvider(), // Bereitstellung des ProfilePictureProviders
      child: MaterialApp(
        title: 'Your App Title',
        home: LoginScreen(), // Startseite ist der LoginScreen
      ),
    );
  }
}