import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/screens/chat/chat.dart';

// Sample user data
final List<String> users = [
  'User 1',
  'User 2',
  'User 3',
  'User 4',
  'User 5',
  'User 6',
  'User 7',
  'User 8',
  'User 9',
  'User 10',
];

// Screen for social activities
class SocialCalendar extends StatelessWidget {
  const SocialCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Calendar'),
      ),
      // Background gradient
      backgroundColor: gradientEnd,
      body: ListView.builder(
        itemCount: users.length, // Number of users
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                    MaterialPageRoute(builder: (context) => ChatsCalendar(user: users[index])),
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
