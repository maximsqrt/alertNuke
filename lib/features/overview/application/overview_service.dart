import 'package:alertnukeapp/features/calendar/presentation/calendar.dart';
import 'package:alertnukeapp/features/icons/presentation/icons.dart';
import 'package:alertnukeapp/features/icons/presentation/icons_screen.dart';
import 'package:alertnukeapp/screens/chat/chat.dart';
import 'package:alertnukeapp/screens/settings/settings.dart';
import 'package:alertnukeapp/screens/social/social.dart';
import 'package:flutter/material.dart';

class OverviewService {

    static int selectedIndex = 0;

    static List<Widget> widgetOptions = <Widget>[
    Calendar(),
    ChatCalendar(),
    SocialCalendar(),
    IconsScreen(),
    SettingsScreen(),
  ];


}