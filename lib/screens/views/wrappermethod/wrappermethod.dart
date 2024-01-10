import 'package:alertnukeapp/screens/calender/year/year.dart';
import 'package:alertnukeapp/screens/wrapper.dart';
import 'package:flutter/material.dart';

///Methode austüfteln die den Wrapper einbindet und in den Screens aufgerufen werde kann////import 'package:flutter/material.dart';

class CustomBottomNavigationBar {
  static Widget build({
    required int selectedIndex,
    required ValueChanged<int> onItemTapped,
  }) {
    return BottomNavigationBar(
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
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavigationBar.build(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}


