import 'package:alertnukeapp/features/overview/application/overview_service.dart';
import 'package:alertnukeapp/screens/social/social.dart';
import 'package:flutter/material.dart';

// Hauptfarben für den Hintergrundgradienten
final Color gradientStart = const Color(0xFF6CA7BE);
final Color gradientEnd = const Color(0xFF2E0B4B);

// Screen für Chats
class ChatsCalendar extends StatelessWidget {
  final String? user; //? da optional 

  // Constructor with an optional parameter
  const ChatsCalendar({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Scaffold(appBar: AppBar(
      leading: Container(
      // Updated arrow icon
         
  ), 
    
    
      
      backgroundColor: Colors.transparent,
    title: Image.asset(
              'assets/AlertNuke.png',
              width: 200, // specify the width
              // specify the height
            ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors:  [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],

            
            
            ),
            ),
          ),
        ),
      
      body: ListView.builder(
        itemCount: 20, // Anzahl der Nachrichten erhöhen
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: ListTile(
              title: Text(user != null ? 'Nachricht ${index + 1} from $user' : 'Nachricht ${index + 1}'),
              // Weitere Funktionen für Nachrichten hinzufügen...
            ),
          );
        },
      ),
    );
  }
}
