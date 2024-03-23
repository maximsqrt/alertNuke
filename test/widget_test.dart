import 'package:alertnukeapp/features/authentication/presentation/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:dein_projekt/main.dart'; // Importiere deine Hauptdatei.

void main() {
  testWidgets('Login Screen Test', (WidgetTester tester) async {
    // Build the login screen and trigger a frame.
    await tester.pumpWidget( MaterialApp(home: LoginScreen()));

    // Verify that the 'Login with Google' button is present.
    expect(find.text('Login with Google'), findsOneWidget);

    // You can add more test cases here, e.g., tapping the button and checking the result.
  });
}
