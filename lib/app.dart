import 'package:alertnukeapp/features/authentication/presentation/login.dart';
import 'package:alertnukeapp/features/icons/domain/image_notifier.dart';
import 'package:alertnukeapp/features/icons/presentation/icon_notifier.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
     
    ChangeNotifierProvider(
      create: (context) => ProfilePictureProvider()), 
     
    ],
      child: MaterialApp(
        
        home: LoginScreen(), // Startseite ist der LoginScreen
      ),
    );
  }
}
