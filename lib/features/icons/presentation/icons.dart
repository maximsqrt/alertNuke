import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/config/customgradientappbar.dart';
import 'package:alertnukeapp/features/icons/presentation/iconslist.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart'; // Import the Unicons library

class IconsScreen extends StatefulWidget {
  @override
  _IconsScreenState createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  List<IconData> allUnicons = uniconsList;
  List<IconData> filteredIcons = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredIcons = allUnicons;
  }

  void filterIcons(String query) {
    List<IconData> filtered = allUnicons.where((icon) {
      return icon.toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredIcons = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          children: <Widget>[
            GradientAppBar(
              logo: Image.asset(
                'assets/AlertNuke.png',
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: filterIcons,
                decoration: InputDecoration(
                  labelText: 'Search for Icon',
                  prefixIcon: Icon(UniconsLine.search),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: SettingsBackgroundColor.linearGradient(),
                  boxShadow: [
                    // Add box shadow here
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Scrollbar(
                  thickness: 10,
                  child: ListView.builder(
                    itemCount: filteredIcons.length,
                    itemBuilder: (context, index) {
                      final IconData icon = filteredIcons[index];
                      final String iconName = icon.toString();
                      return ListTile(
                        leading: Icon(icon, color: FancyFontColor.primaryColor),
                        title: Text(iconName,
                            style:
                                TextStyle(color: FancyFontColor.primaryColor)),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
