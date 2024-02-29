import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Das Provider-Objekt, das das aktuelle Profilbild verfolgt
class ProfilePictureProvider extends ChangeNotifier {
  String? _profilePictureUrl;

  String? get profilePictureUrl => _profilePictureUrl;

  // Methode zum Aktualisieren des Profilbilds
  void updateProfilePictureUrl(String newProfilePictureUrl) {
    _profilePictureUrl = newProfilePictureUrl;
    notifyListeners(); // Benachrichtigen Sie die Abonnenten über die Aktualisierung
  }
}

class ProfilePictureWidget extends StatelessWidget {
  final String userId;

  const ProfilePictureWidget({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Verwenden Sie Consumer, um auf das Profilbild-Provider-Objekt zuzugreifen
    return Consumer<ProfilePictureProvider>(
      builder: (context, profilePictureProvider, _) {
        String? profilePictureUrl = profilePictureProvider.profilePictureUrl;

        if (profilePictureUrl != null && profilePictureUrl.isNotEmpty) {
          return Image.network(
            profilePictureUrl,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          );
        } else {
          return _buildDefaultBackground();
        }
      },
    );
  }

  Widget _buildDefaultBackground() {
    return Image.asset(
      'assets/AlertNuke.png',
      width: 200,
    );
  }
}
