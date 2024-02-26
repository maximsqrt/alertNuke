

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageUploadProvider extends ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadImage(File imageFile, String userId) async {
    try {
      // Erstellen Sie eine Referenz für den Speicherort, an dem das Bild in Firebase hochgeladen werden soll
      Reference ref = _storage.ref().child('userProfilePics/$userId');

      // Bild hochladen
      UploadTask uploadTask = ref.putFile(imageFile);

      // Warten Sie, bis der Upload abgeschlossen ist, und erhalten Sie den Download-URL
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Hier können Sie die URL verwenden oder anderweitig verwenden, z.B. speichern Sie sie in einer Datenbank
      print('Uploaded image URL: $downloadUrl');
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
    }
  }
}
