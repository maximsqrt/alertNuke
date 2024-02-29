// In einer neuen Datei namens colors.dart

import 'package:alertnukeapp/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/views/logo.dart'; // Stellen Sie sicher, dass Sie die erforderlichen Importe hinzufügen

class SettingsBodyBuilder {
  static Widget buildBody(BuildContext context, Color fontColor, LinearGradient buttonColor, Widget buildContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Hintergrund mit linearem Verlauf
        Container(
          decoration: BoxDecoration(
            gradient: SettingsBackgroundColor.linearGradient(),
          ),
        ),
        // Restlicher Inhalt
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: LogoBackgroundImage(), // Hintergrundbild
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Fancy Profile',
                style: TextStyle(fontSize: 24, color: fontColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Weitere Widgets hier hinzufügen, z.B. EditableFields
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // Hier kann auch der Button platziert werden
              // _buildSaveButton(context, buttonColor),
            ],
          ),
        ),
      ],
    );
  }

  // Weitere Hilfsmethoden oder Widgets können hier hinzugefügt werden
}
