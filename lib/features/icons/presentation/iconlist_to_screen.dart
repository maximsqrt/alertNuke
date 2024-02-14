import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class IconList extends StatelessWidget {
  final List<IconData> icons;
  final void Function(BuildContext, IconData) onTap;

  const IconList({
    Key? key,
    required this.icons,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: icons.length,
      itemBuilder: (context, index) {
        final IconData icon = icons[index];
        return ListTile(
          onTap: () => onTap(context, icon),
          leading: Icon(icon),
          title: Text(icon.toString()),
        );
      },
    );
  }



}

