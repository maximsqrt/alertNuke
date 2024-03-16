import 'package:alertnukeapp/common/iconservice.dart';
import 'package:flutter/material.dart';
import 'package:alertnukeapp/features/icons/data/firebase_icon_repository.dart';
import 'package:provider/provider.dart';
import 'package:alertnukeapp/common/savediconsprovider.dart';

class SymbolTap extends StatelessWidget {
  const SymbolTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Assuming SavedIconsNotifier is your provider for storing/fetching icons
    final iconRepository = Provider.of<FirebaseIconRepository>(context, listen: false);
final iconsNotifier = Provider.of<SavedIconsNotifier>(context, listen: false);
final iconService = IconService(iconRepository, iconsNotifier);

    
     return AlertDialog(
      title: const Text('Choose Your Icon'),
      content: Container(
        // Define a fixed height for the container, or make it dynamic based on content or screen size as needed
        height: 200, // Example fixed height
        width: double.maxFinite, // Use the maximum width available
        child: FutureBuilder<List<IconWithName>>(
          future: IconService(iconRepository, iconsNotifier).fetchIcons(), // Implement this method to fetch icons from Firebase
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final icons = snapshot.data ?? [];
            return ListView.builder(
              shrinkWrap: true,
              itemCount: icons.length,
              itemBuilder: (context, index) {
                final iconData = icons[index];
                return ListTile(
                  leading: Icon(iconData.icon), // Your IconWithData might need adjustments to work
                  title: Text(iconData.name),
                  onTap: () => Navigator.of(context).pop(iconData),
                );
              },
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}