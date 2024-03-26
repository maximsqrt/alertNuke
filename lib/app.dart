import 'package:alertnukeapp/common/iconservice.dart';
import 'package:alertnukeapp/common/savediconsprovider.dart';
import 'package:alertnukeapp/features/authentication/presentation/login.dart';
import 'package:alertnukeapp/features/calendar/application/maps.provider.dart';
import 'package:alertnukeapp/features/calendar/application/year.provider.dart';
import 'package:alertnukeapp/features/icons/data/firebase_icon_repository.dart';
import 'package:alertnukeapp/features/icons/domain/image_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => YearProvider()),
        ChangeNotifierProvider(create: (context) => SavedIconsNotifier()),
        ChangeNotifierProvider(create: (context) => ProfilePictureProvider()),
        Provider(
          create: (context) => FirebaseIconRepository(),
        ),
        Provider<IconService>(
          create: (context) => IconService(
            Provider.of<FirebaseIconRepository>(context, listen: false),
            Provider.of<SavedIconsNotifier>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        home: LoginScreen(), // Startseite ist der LoginScreen
      ),
    );
  }
}
