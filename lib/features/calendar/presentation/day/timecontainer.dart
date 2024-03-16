import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  final ScrollController timeController;

  TimeContainer({Key? key, required this.timeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(114, 171, 205, 239),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: ListView.builder(
        controller: timeController,
        itemCount: 48, // Represents each half-hour slot in a 24-hour day
        itemBuilder: (context, index) {
          final hour = index ~/ 2; // Integer division to get the hour
          final minute = (index % 2) * 30; // Multiply the remainder to get the minutes (0 or 30)
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0), // Increased padding
            child: Text(
              '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16, // Increased font size for better visibility
              ),
            ),
          );
        },
      ),
    );
  }
}
