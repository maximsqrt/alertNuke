// ignore_for_file: library_private_types_in_public_api

import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/features/icons/data/firebase_icon_repository.dart';
import 'package:alertnukeapp/features/icons/data/icon_repository.dart';
import 'package:flutter/material.dart';
import 'package:alertnukeapp/features/icons/presentation/icons_screen.dart';
import 'package:icony/icony_ikonate.dart';

class IconsChoosenScreen extends StatefulWidget {
  
  const IconsChoosenScreen(); // Correct the constructor syntax

  @override
  _IconsChoosenState createState() => _IconsChoosenState();
}

class _IconsChoosenState extends State<IconsChoosenScreen> {
  List<IconWithName> chosenIcons = [];

  @override
  void initState() {
    super.initState();
    _loadIcons(); // Laden Sie die Icons beim Initialisieren des Bildschirms
  }

Future<void> _loadIcons() async {
    String? userId = await FirebaseIconRepository().getCurrentUserId();
    if (userId != null) {
      List<IconWithName> icons = await FirebaseIconRepository().getIcondataCollection(userId);
      // Konvertieren Sie die IconDataModel-Objekte in IconWithName-Objekte und aktualisieren Sie die Liste
      setState(() {
        chosenIcons = icons.map((icon) => IconWithName(name: icon.iconText, icon: IconData(int.parse(icon.iconString)))).toList();
      });
    } else {
      print('User ID is null'); // Behandeln Sie den Fall, wenn die Benutzer-ID nicht verfügbar ist
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(202, 199, 64, 181),
      appBar: AppBar(
        title: const Text('Choooosen Icons'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: chosenIcons.length < 10 ? chosenIcons.length + 1 : 10,
        itemBuilder: (context, index) {
          if (index == chosenIcons.length && chosenIcons.length < 10) {
            return ListTile(
              onTap: () {
                _showIconSelection(context);
              },
              title: const Text('Add Icon'),
              leading: const Icon(Icons.add),
            );
          } else {
            final iconWithName = chosenIcons[index];
            return ListTile(
              leading: Icon(iconWithName.icon),
              title: Text(iconWithName.name),
            );
          }
        },
      ),
    );
  }

  Future<void> _showIconSelection(BuildContext context) async {
    IconData? selectedIcon = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IconsScreen()),
    );

    if (selectedIcon != null) {
      setState(() {
        chosenIcons.add(IconWithName(icon: selectedIcon, name: 'Icon'));
      });
    }
  }
}


class IconWithName {
  final IconData icon;
  final String name;
  final String iconText;
  final String iconString;

  IconWithName({
    required this.name,
    required this.icon,
    this.iconText = '4',
    this.iconString = '4',
  });
}

