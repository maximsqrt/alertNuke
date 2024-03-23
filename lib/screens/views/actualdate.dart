import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActualDate extends StatelessWidget {
  final ScrollController timeController;
  final DateTime now;

  ActualDate({required this.timeController, required this.now});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        Text(
          DateFormat('dd / MM / yy').format(now),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        
      ],
    );
  }
}
