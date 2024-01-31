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
        physics: const NeverScrollableScrollPhysics(),
        controller: timeController,
        itemCount: 48,
        padding: EdgeInsets.zero,
        itemBuilder: (context, timeIndex) {
          final totalMinutes = ((timeIndex * 30) + (6 * 60)) % (24 * 60);
          final hour = totalMinutes ~/ 60;
          final minute = totalMinutes % 60;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 7.0),
            child: Text(
              '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }
}