import 'dart:io';
import 'package:alertnukeapp/screens/settings/applications.dart/applications.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePicScreen extends StatefulWidget {
  final Function(File)? onImageSelected; // Define onImageSelected function

  ProfilePicScreen({Key? key, this.onImageSelected}) : super(key: key);

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
      _imageFile = pickedImage != null ? File(pickedImage.path!) : null;
    });

    // Call the onImageSelected function if it's provided
    if (widget.onImageSelected != null && _imageFile != null) {
      widget.onImageSelected!(_imageFile!);
    // Upload the selected image to Firebase Storage
      await _uploadImage(_imageFile!);
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    try {
      // Get the current user's ID
      String? userId = await FirebaseImageStorageService().getCurrentUserId();
      if (userId == null) {
        print('No user logged in.');
        return;
      }

      // Upload the image to Firebase Storage
      String? downloadUrl = await FirebaseImageStorageService().uploadProfilePicture(imageFile, userId);
      if (downloadUrl != null) {
        print('Uploaded image URL: $downloadUrl');
      } else {
        print('Failed to upload image');
      }
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    // Your UI implementation
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    height: 200,
                    width: 200,
                  )
                : Placeholder(
                    fallbackHeight: 200,
                    fallbackWidth: 200,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Take Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
