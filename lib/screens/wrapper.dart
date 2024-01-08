import 'package:alertnukeapp/screens/calender/year/year.dart';
import 'package:flutter/material.dart';



class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
   YearCalendar(),
    Text("Chat"),
    Text("Socials"),
    Text("Icons"),
    Text("Settings")
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
