// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// // Das Provider-Objekt, das das aktuelle Profilbild verfolgt
// class ProfilePictureProvider extends ChangeNotifier {
//   String? _profilePictureUrl;

//   String? get profilePictureUrl => _profilePictureUrl;

//   // Methode zum Aktualisieren des Profilbilds
//   void updateProfilePicture(String newProfilePictureUrl) {
//     _profilePictureUrl = newProfilePictureUrl;
//     notifyListeners(); // Benachrichtigen Sie die Abonnenten über die Aktualisierung
//   }
// }

// class ProfilePictureWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Verwenden Sie Provider.of, um auf das Profilbild-Provider-Objekt zuzugreifen
//     String? profilePictureUrl =
//         Provider.of<ProfilePictureProvider>(context).profilePictureUrl;

//     if (profilePictureUrl != null && profilePictureUrl.isNotEmpty) {
//       return Image.network(
//         profilePictureUrl,
//         height: 200,
//         width: 200,
//         fit: BoxFit.cover,
//       );
//     } else {
//       return _buildDefaultBackground();
//     }
//   }

//   Widget _buildDefaultBackground() {
//     return Image.asset(
//       'assets/AlertNuke.png',
//       width: 200,
//     );
//   }
// }
