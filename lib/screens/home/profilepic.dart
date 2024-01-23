import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicScreen extends StatefulWidget {
  @override
  _ProfilPicScreenState createState() => _ProfilPicScreenState();
}

class _ProfilPicScreenState extends State<ProfilePicScreen> {
  File? _imageFile; // Variable to store the selected image file

  // Function to open the image picker and set the selected image
  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    setState(() {
      // Update the state with the selected image file
      _imageFile = pickedImage != null ? File(pickedImage.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the selected image or a placeholder if none is selected
          _imageFile != null
              ? Image.file(
                  _imageFile!,
                  height: 200,
                  width: 200,
                )
              : const Placeholder(
                  fallbackHeight: 200,
                  fallbackWidth: 200,
                ),
          const SizedBox(height: 20),
          // Button to open the image picker for gallery
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: const Text('Pick Image from Gallery'),
          ),
          const SizedBox(height: 10),
          // Button to open the image picker for camera
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: const Text('Take Photo'),
          ),
          ElevatedButton(
            onPressed: () {
            _pickImage(ImageSource.camera);
    Navigator.pop(context); // This line will navigate back to the previous screen (SettingsScreen)
          },///brauchen noch ne Async Funktion hier und das image muss zurück geparesed werden.
            child: const Text('Back'),
          ),
        ],
  
      ),
    );
        
      
    
  }
}


/*File? _imageFile;: Diese Variable speichert die ausgewählte Bilddatei. 
Der Typ File? bedeutet, dass sie auch null sein kann.
_pickImage(ImageSource source): Diese Funktion öffnet den Bildauswähler 
(Galerie oder Kamera) und aktualisiert den Zustand mit der ausgewählten Bilddatei.
Image.file(_imageFile!, height: 200, width: 200): Zeigt das ausgewählte Bild an.
 Wenn kein Bild ausgewählt ist, wird ein Placeholder angezeigt.
ElevatedButton: Zwei Schaltflächen, eine zum Auswählen eines Bildes aus der 
Galerie und eine zum Aufnehmen eines Fotos mit der Kamera.*/

///Erriner _Var konvention für Privat Variable also nur da sichtbar