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
    return Scaffold(
      appBar: AppBar(
        title: Text(user != null ? 'Chats with $user' : 'Chats Calendar'),
      ),
      // Hintergrundgradient
      backgroundColor: gradientEnd,
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
