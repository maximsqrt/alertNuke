import 'package:alertnukeapp/screens/login/login.dart';
import 'package:flutter/material.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
String? password; 
String? email;
String? repeatPassword;


void signUp(){

//passwortvergleich, ob werte gesetzt sind 
// 


}

//Wie mit => signup auf die Funktion verweisen 



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
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    setState((){
                      email = value;
                    });
                  },
                  style: const TextStyle(color: Colors.white), // Textfarbe der Eingabefelder
                  decoration: const InputDecoration(
                    labelText: 'Choose Username',
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                onChanged: (value) {
                    setState((){
                      email = value;
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  obscureText: true, // Versteckte Eingabe für Passwort
                  decoration: const InputDecoration(
                    labelText: 'Choose Password',
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
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                   onChanged: (value) {
                    setState((){
                      repeatPassword = value;
                    });
                  },
                  style: const TextStyle(color: Colors.white), // Textfarbe der Eingabefelder
                  obscureText: true, //versteckte Eingabe für Passwort
                  decoration: const InputDecoration(
                    labelText: 'Repeat Password',
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
             ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Hintergrundfarbe des Buttons
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      fontSize: 20, // Textgröße
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}

