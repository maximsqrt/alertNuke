import 'package:flutter/material.dart';



class LogoBottomNavigationBar extends StatelessWidget {
  const LogoBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: LogoWidget(imagePath: 'assets/Month.png'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: LogoWidget(imagePath: 'assets/Chat.png'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: LogoWidget(imagePath: 'assets/Socials.png'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: LogoWidget(imagePath: 'assets/Icons.png'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: LogoWidget(imagePath: 'assets/Settings.png'),
          label: '',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      
      // Du kannst hier weitere benötigte Eigenschaften für BottomNavigationBar hinzufügen
      // (z.B., currentIndex, onTap, ...)
    );
  }
}

class LogoWidget extends StatelessWidget {
  final String imagePath;

  const LogoWidget({super.key, required this.imagePath});

@override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28, // Passe die Breite nach Bedarf an
      height: 28, // Passe die Höhe nach Bedarf an
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
