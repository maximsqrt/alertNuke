import 'package:alertnukeapp/application/FirebaseUserData.dart';
import 'package:alertnukeapp/config/bodybuilder.dart';
import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/config/custombuttons.dart';

import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/home/profilepic.dart'; // Import ProfilePicScreen

// EditableField widget for displaying and editing user information
class EditableField extends StatelessWidget {
  final String label;
  final String? value;

  // Constructor to initialize the label
  const EditableField({Key? key, required this.label, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Column with label and TextFormField for user input
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the editable field
        Text(
          label,
          style:
              const TextStyle(fontSize: 18, color: FancyFontColor.primaryColor),
        ),
        // Vertical spacing
        const SizedBox(height: 10),
        // TextFormField for user input/editing
        TextFormField(
          initialValue: value,
          // Add necessary properties for user input/editing
        ),
      ],
    );
  }
}

// Main screen for user settings
class SettingsScreen extends StatelessWidget {
  Color get fontColor => FancyFontColor.primaryColor;
  LinearGradient get buttonColor => FancyButtonColor.linearGradient();
  @override
  Widget build(BuildContext context) {
    // Scaffold containing the main body of the settings screen
    return Scaffold(
      body: SettingsBodyBuilder.buildBody(context, fontColor, buttonColor, _buildContent(context, fontColor, buttonColor)),
      // Add a floating action button to trigger ProfilePicScreen
      floatingActionButton: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 160.0),
          child: GestureDetector(
            onTap: () => showBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 220,
                  child: _bottomSheet(),
                );
              },
            ),
            child: Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(

        ///Hier die Methoden rein aus dem ProfilePicScreen!! noch auslagern dafür
        );
  }

  // Builds the content in the middle of the screen
  Widget _buildContent(
      BuildContext context, Color fontcolor, LinearGradient buttoncolor) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      left: 0,
      right: 0,
      // Column for vertically stacked content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header text
          Text(
            'Your Fancy Profile',
            style: TextStyle(
                fontSize: 11, color: fontcolor, fontWeight: FontWeight.bold),
          ),
          // Spacing
          const SizedBox(height: 20),
          // Editable fields for user information
          EditableField(
            label: 'Name:',
            value: FirebaseUserData.username,
          ),
          const SizedBox(height: 10),
          const EditableField(label: 'Phone Number:'),
          const SizedBox(height: 10),
          EditableField(
            label: 'Email Address:',
            value: FirebaseUserData.email,
          ),
          // Vertical spacing
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          // Save button with gradient background
          _buildSaveButton(context),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return FancyButton(
      title: 'Login',
      onTap: () {},
      key: UniqueKey(),
    );
  }
}
