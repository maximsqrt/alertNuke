import 'package:alertnukeapp/features/overview/application/overview_service.dart';
import 'package:alertnukeapp/features/overview/presentation/logo.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  void _onItemTapped(int index) {
    setState(() {
      OverviewService.selectedIndex = index;
      // CalenderStatus = CalenderStatus.year; //Provider erstellen 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: OverviewService.widgetOptions [ 
        OverviewService.selectedIndex
       ],
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
        currentIndex: OverviewService.selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}



