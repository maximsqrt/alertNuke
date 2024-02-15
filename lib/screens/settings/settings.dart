import 'package:alertnukeapp/config/colors.dart';

import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/views/logo.dart';
import 'package:alertnukeapp/screens/home/profilepic.dart';  // Import ProfilePicScreen

// EditableField widget for displaying and editing user information
class EditableField extends StatelessWidget {
  final String label;

  // Constructor to initialize the label
  const EditableField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // Column with label and TextFormField for user input
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the editable field
        Text(
          label,
          style: const TextStyle(fontSize: 18, color: FancyFontColor.primaryColor),
        ),
        // Vertical spacing
        const SizedBox(height: 10),
        // TextFormField for user input/editing
        TextFormField(
          // Add necessary properties for user input/editing
        ),
      ],
    );
  }
}

// Main screen for user settings
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold containing the main body of the settings screen
    return Scaffold(
      body: _buildBody(context),
      // Add a floating action button to trigger ProfilePicScreen
      floatingActionButton: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 160.0),
          child: FloatingActionButton(
            
    
        onPressed: () {
          _openProfilePicScreen(context);
        },
        tooltip: 'Change Profile Picture',
        child: Icon(Icons.image),
      ),
    ),
  ),
);
  }
  // Builds the main body of the settings screen
  Widget _buildBody(BuildContext context) {
    // Styling variables for colors
    var backgroundcolor = SettingsBackgroundColor.linearGradient();
    var fontcolor = FancyFontColor.primaryColor;
    var buttoncolor = FancyButtonColor.linearGradient();

    // Container with gradient background
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundcolor,
      ),
      // Padding to ensure content is not at the screen edges
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // Stack to overlay background and content
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image with color filter
            _buildBackgroundImage(context),
            // Content in the middle of the screen
            _buildContent(context, fontcolor, buttoncolor),
          ],
        ),
      ),
    );
  }

  // Builds the background image with color filter
  Widget _buildBackgroundImage(BuildContext context) {
    // LogoBackgroundImage instance
    var logoBackgroundImage = LogoBackgroundImage();

    // Positioned fill to cover the entire screen
    return Positioned.fill(
      child: ColorFiltered(
        // Color filter for background tint
        colorFilter: const ColorFilter.mode(
          Color.fromARGB(105, 147, 178, 204),
          BlendMode.srcIn,
        ),
        // Padding to adjust the position of the background image
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          // LogoBackgroundImage widget
          child: logoBackgroundImage,
        ),
      ),
    );
  }

  // Builds the content in the middle of the screen
  Widget _buildContent(BuildContext context, Color fontcolor, LinearGradient buttoncolor) {
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
            style: TextStyle(fontSize: 24, color: fontcolor, fontWeight: FontWeight.bold),
          ),
          // Spacing
          const SizedBox(height: 20),
          // Editable fields for user information
          const EditableField(label: 'Name:'),
          const SizedBox(height: 10),
          const EditableField(label: 'Phone Number:'),
          const SizedBox(height: 10),
          const EditableField(label: 'Email Address:'),
          // Vertical spacing
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          // Save button with gradient background
          _buildSaveButton(buttoncolor),
        ],
      ),
    );
  }

  // Builds the Save button with a gradient background
  Widget _buildSaveButton(LinearGradient buttoncolor) {
    return Container(
      decoration: BoxDecoration(
        gradient: buttoncolor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // Elevated button with Save text
      child: ElevatedButton(
        onPressed: () {
          // Add functionality to save user profile information
        },
        child: const Text(
          'Save',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  //Function to open ProfilePicScreen
  void _openProfilePicScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePicScreen()),
    );
  }
}
