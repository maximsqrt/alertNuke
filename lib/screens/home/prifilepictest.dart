// import 'dart:io';
// import 'package:alertnukeapp/screens/home/firebaseuploadprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:riverpod/riverpod.dart';


// class Apptest extends StatefulWidget {
//   const Apptest({Key? key}) : super(key: key);

//   @override
//   _ApptestState createState() => _ApptestState();
// }

// class _ApptestState extends State<Apptest> {
//   File? _imageFile;

//   Future<void> pickImage() async {
//     final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage == null) return;
//     final imageTemp = File(pickedImage.path);
//     setState(() {
//       _imageFile = imageTemp;
//     });
//   }

//   void uploadImageToFirebase() {
//     if (_imageFile != null) {
//       final provider = Provider.of<ImageUploadProvider>(context, listen: false);

//       final userId = ''; // Fügen Sie hier die UserID ein
//       provider.uploadImage(_imageFile!, userId);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image Picker Example"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 pickImage();
//               },
//               child: Text('Pick Image from Gallery'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Hier sollte die Logik zum Auswählen eines Bildes aus der Kamera stehen
//               },
//               child: Text('Pick Image from Camera'),
//             ),
//             SizedBox(height: 20),
//             _imageFile != null
//                 ? Image.file(
//                     _imageFile!,
//                     height: 200,
//                     width: 200,
//                   )
//                 : Container(),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 uploadImageToFirebase();
//               },
//               child: Text('Upload Image to Firebase'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
