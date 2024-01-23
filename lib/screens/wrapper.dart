import 'package:alertnukeapp/screens/Icons/iconsscreen.dart';
import 'package:alertnukeapp/screens/calender/year/year.dart';
import 'package:alertnukeapp/screens/settings/settings.dart';
import 'package:flutter/material.dart';



class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
   YearCalendar(),
    Text("Chat"),
    Text("Socials"),
    IconsScreen(),
   SettingsScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
          _selectedIndex = index;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: LogoWidget(imagePath: 'assets/Month.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: LogoWidget(imagePath: 'assets/chat_360.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: LogoWidget(imagePath: 'assets/Socials.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: LogoWidget(imagePath: 'assets/bulb.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: LogoWidget(imagePath: 'assets/setting.png'),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final String imagePath;

  const LogoWidget({Key? key, required this.imagePath}) : super(key: key);


@override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30, // Passe die Breite nach Bedarf an
      height: 30, // Passe die Höhe nach Bedarf an
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
/*Hauptklasse Root: Diese Klasse ist der Einstiegspunkt für die BottomNavigationBar. Der Konstruktor nimmt einen optionalen Key-Parameter an, der zur Identifizierung des Widgets verwendet wird.

Key-Parameter: Der Key-Parameter ermöglicht die eindeutige Identifizierung eines Widgets. In diesem Fall wird er an die super-Klasse übergeben, um die Elternklasse zu initialisieren.

StatefulWidget und State: Die Root-Klasse erbt von StatefulWidget, was bedeutet, dass sie einen zugehörigen State-Objekt erstellt. Der State speichert den aktuellen Zustand des Widgets, insbesondere den ausgewählten Index der BottomNavigationBar.
_RootState-Klasse: Diese Klasse repräsentiert den Zustand der Root-Klasse. Sie enthält den ausgewählten Index und eine Liste von Widgets für die verschiedenen BottomNavigationBar-Elemente.
_onItemTapped-Methode: Diese Methode wird aufgerufen, wenn ein Element in der BottomNavigationBar ausgewählt wird. Sie aktualisiert den Zustand, um den ausgewählten Index zu ändern.
_widgetOptions-Liste: Diese Liste enthält die Widgets, die den Inhalt der verschiedenen BottomNavigationBar-Elemente repräsentieren, einschließlich des Jahreskalenders und Platzhaltern für andere Funktionen.
build-Methode: Diese Methode erstellt die visuelle Darstellung des Widgets. Sie verwendet den ausgewählten Index, um das entsprechende Widget aus der _widgetOptions-Liste anzuzeigen.
LogoWidget-Klasse: Eine separate Widget-Klasse, die ein Logo anzeigt. Der Konstruktor akzeptiert den Pfad zum Bild und die build-Methode erstellt die visuelle Darstellung des Logos.*/