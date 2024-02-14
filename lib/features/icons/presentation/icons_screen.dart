import 'package:alertnukeapp/features/icons/presentation/iconlist_to_screen.dart';
import 'package:alertnukeapp/features/icons/presentation/iconselection.dart';
import 'package:flutter/material.dart';
import 'iconlist.dart'; // Import the iconlist.dart file

class IconsScreen extends StatefulWidget {
  const IconsScreen({Key? key}) : super(key: key);

  @override
  _IconsScreenState createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  late List<IconData> allUnicons;
  late List<IconData> filteredIcons;
  final TextEditingController searchController = TextEditingController();
  List<IconWithName> chosenIcons = []; // Define chosenIcons list

  @override
  void initState() {
    super.initState();
    allUnicons = uniconsList; // Access the uniconsList from iconlist.dart
    filteredIcons = allUnicons;
  }

  void filterIcons(String query) {
    setState(() {
      filteredIcons = allUnicons.where((icon) {
        return icon.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: <Widget>[
           SearchBar(controller: searchController, onChanged: filterIcons),
          Expanded(
            
            child: IconList(icons: filteredIcons, onTap: _showNameDialog),
          ),
        ],
      ),
    );
  }

  void _onIconTapped(BuildContext context, IconData icon) {
    Navigator.pop(context, icon);
  }

  Future<void> _showNameDialog(BuildContext context, IconData icon) async {
    String? iconName = await showDialog<String>(
      context: context,
      builder: (_) => NameDialog(icon: icon),
    );

    if (iconName != null && iconName.isNotEmpty) {
      setState(() {
        chosenIcons.add(IconWithName(icon: icon, name: iconName));
      });
    }
  }
}

class NameDialog extends StatelessWidget {
  final IconData icon;

  const NameDialog({required this.icon});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return AlertDialog(
      title: const Text('Name your icon'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, size: 24),
              const SizedBox(width: 10),
              const Text('Icon'),
            ],
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter icon name'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
