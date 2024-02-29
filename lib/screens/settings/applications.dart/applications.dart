import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseImageStorageService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }
Future<String?> getProfilePictureUrl(String userId) async {
  try {
    // Document reference for the user
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    
    // Check if the user document exists
    if (userSnapshot.exists) {
      // Get the profile picture URL from the user document
      return (userSnapshot.data() as Map<String,dynamic>)['profilePictureUrl'];
    } else {
      print('User document does not exist');
      return null;
    }
  } catch (e) {
    print('Error occurred while fetching profile picture URL: $e');
    return null;
  }
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
  Future<void> storeImageUrl(String imageUrl, String userId) async {
     await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'profilePictureUrl': imageUrl,
     });
  }
}