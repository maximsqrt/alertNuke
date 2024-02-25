import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImageStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> getCurrentUserId() async {
    try {
      // Get the current user from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;
      
      // If user is not null, return the user ID (UID)
      if (user != null) {
        return user.uid;
      } else {
        // Handle the case where no user is logged in
        return null;
      }
    } catch (e) {
      print('Error retrieving current user ID: $e');
      return null;
    }
  }

  Future<String?> uploadProfilePicture(File file, String path) async {
    try {
      // Get the current user's ID
      String? userId = await getCurrentUserId();
      if (userId == null) {
        print('No user logged in.');
        return null;
      }

      // Get a reference to the location where the image will be stored
      Reference ref = _storage.ref().child('profilePictures/$userId');

      // Upload the file to Firebase Storage
      TaskSnapshot uploadTask = await ref.putFile(file);

      // Get the download URL for the image
      String downloadUrl = await uploadTask.ref.getDownloadURL();

      // Return the download URL
      return downloadUrl;
    } catch (e) {
      print('Error uploading profile picture: $e');
      return null;
    }
  }
}
