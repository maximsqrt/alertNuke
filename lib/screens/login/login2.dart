
import 'package:alertnukeapp/features/authentication/presentation/signup.dart';
import 'package:flutter/material.dart';


class Login2Screen extends StatelessWidget {
  const Login2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF884082), Color(0xFF1E1854)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
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

              // Text Fields for Username and Password
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white), // Textfarbe der Eingabefelder
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white), // Textfarbe des Labels
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Rahmenfarbe im Normalzustand
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Rahmenfarbe im Fokus
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true, // Versteckte Eingabe für Passwort
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),

              // "Forgot Password" link
              TextButton(
                onPressed: () {
                  // Implement your forgot password functionality here
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              // "Sign Up" link
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

