import 'package:flutter/material.dart';
import 'package:alertnukeapp/features/icons/presentation/icons.dart';
import 'package:alertnukeapp/features/icons/presentation/icons_screen.dart';

class IconsChoosen extends StatefulWidget {
  final IconWithName iconWithName;

  IconsChoosen({required this.iconWithName}); // Correct the constructor syntax

  @override
  _IconsChoosenState createState() => _IconsChoosenState();
}

class _IconsChoosenState extends State<IconsChoosen> {
  List<IconWithName> chosenIcons = []; // Define chosenIcons list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(202, 199, 64, 181),
      appBar: AppBar(
        title: const Text('Chosen Icons'),
        //  leading: IconButton(
        //   icon: Icon(Icons.arrow_back), // Add an icon to the leading property
        //   onPressed: () {
        //     Navigator.pop(context); // Navigate back when the icon is pressed
        //   }
        //  ),
      ),
      body: ListView.builder(
        itemCount: chosenIcons.length < 10 ? chosenIcons.length + 1 : 10,
        itemBuilder: (context, index) {
          if (index == chosenIcons.length && chosenIcons.length < 10) {
            return ListTile(
              onTap: () {
                _showIconSelection(context); // Call _showIconSelection when tapped
              },
              title: const Text('Add Icon'),
              leading: const Icon(Icons.add),
            );
          } else {
            final iconWithName = chosenIcons[index];
            return ListTile(
              leading: Icon(iconWithName.icon, size: 40),
              title: Text(iconWithName.name),
            );
          }
        },
      ),
    );
  }

  Future<void> _showIconSelection(BuildContext context) async {
    // Navigate to IconsScreen to select an icon
    IconData? selectedIcon = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IconsScreen()),
    );

    // If an icon is selected, add it to chosenIcons list
    if (selectedIcon != null) {
      setState(() {
        chosenIcons.add(IconWithName(icon: selectedIcon, name: 'Icon')); // You can set a default name or get it from user input
      });
    }
  }
}

class IconWithName {
  final IconData icon;
  final String name;

  IconWithName({required this.icon, required this.name}); // Make sure to provide name
}
