import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/screens/Icons/iconslist.dart';
import 'package:flutter/material.dart';

class IconsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: SettingsBackgroundColor.linearGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: iconList.length,
                        itemBuilder: (context, index) {
                          IconData? iconData = iconList[index][0] as IconData?;
                          String? label = iconList[index][1] as String?;

                          // Check for nullability before using the values
                          if (iconData != null && label != null) {
                            return ListTile(
                              leading: Icon(iconData),
                              title: Text(label),
                              subtitle: Text(
                                  'Code Point: ${iconData.codePoint}'),
                            );
                          } else {
                            // Handle the case where either iconData or label is null
                            return Container(); // You can replace this with an appropriate widget or handle the case differently.
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
