import 'package:alertnukeapp/screens/login/login.dart';
import 'package:alertnukeapp/screens/signup/signup.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF884082),Color(0xFF1E1854)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.asset(
                'assets/logo.png', // Pfad zum Logo-Bild
                width: 200, // Größe des Logos
                height: 200,
              ),
              const SizedBox(height: 20),

              // "Login" Button
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Hintergrundfarbe des Buttons
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20, // Textgröße
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // "or signup" Button
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen())),
                  // Implementiere die Signup-Logik hier
                
                child: const Text('or signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
