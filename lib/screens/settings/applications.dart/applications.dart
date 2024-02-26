import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseImageStorageService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }

  Future<String?> uploadProfilePicture(File imageFile, String userId) async {
    try {
      // Create a reference to the location you want to upload to in firebase
      Reference ref = _storage.ref().child('userProfilePics/$userId');

      // Upload the file to firebase
      UploadTask uploadTask = ref.putFile(imageFile);

      // Waits till the file is uploaded then stores the download url 
      final TaskSnapshot downloadUrl = (await uploadTask);
      
      // The URL of the image stored in firebase
      final String url = (await downloadUrl.ref.getDownloadURL());
      
      return url;

    } catch (e) {
      print('Error occurred while uploading to Firebase Storage: $e');
      return null;
    }
  }
}
