import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/screens/chat/chat.dart';

// Sample user data
final List<String> users = [
  'LordOfTheRealm',
  'EnigmaticEclipse',
  'MysticWhisperer',
  'CelestialChampion',
  'ArcaneAdept',
  'SovereignSorcerer',
  'RegalRuler',
  'IllustriousOracle',
  'NobleNavigator',
  'MajesticMonarch',
];

// Screen for social activities
class SocialCalendar extends StatelessWidget {
  const SocialCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              colors: [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],
            ),
          ),
        ),
      ),
      // Background gradient
      backgroundColor: gradientEnd,
      body: ListView.builder(
        itemCount: users.length, // Number of users
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: ListTile(
                title: Text(users[index]), // Display user name
                // Navigate to chat screen when tapped
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatsCalendar(user: users[index])),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
