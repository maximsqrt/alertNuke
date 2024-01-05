import 'package:alertnukeapp/screens/calender/year/year.dart';
import 'package:flutter/material.dart';



class Root extends StatefulWidget {
  const Root({super.key});

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
    Text("Setting")
  ];

  void _onItemTapped(int index){
    setState(() {
          _selectedIndex = index;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
       
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
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      ),
      
    );
  }
}



class LogoWidget extends StatelessWidget {
  final String imagePath;

  const LogoWidget({super.key, required this.imagePath});

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
