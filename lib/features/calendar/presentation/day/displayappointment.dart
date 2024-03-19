import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AppointmentsDisplay extends StatelessWidget {
  final DateTime selectedDate;

  AppointmentsDisplay({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<User?>(context)?.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('Appointments')
          .where('appointmentDate', 
                isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(selectedDate.year, selectedDate.month, selectedDate.day)),
                isLessThan: Timestamp.fromDate(DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1)))
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        List<Widget> appointmentWidgets = snapshot.data!.docs.map((doc) {
          var appointmentData = doc.data() as Map<String, dynamic>;
          var icon = IconData(appointmentData['iconCodePoint'], fontFamily: appointmentData['iconFontFamily'], fontPackage: appointmentData['iconFontPackage']);
          var name = appointmentData['iconName'];
          var description = appointmentData['appointmentDescription']; // Hinzugefügt für Vollständigkeit
          var appointmentDate = (appointmentData['appointmentDate'] as Timestamp).toDate();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 10),
                Expanded(child: Text("$name - $description ")),
              ],
            ),
          );
        }).toList();

        return SingleChildScrollView(
          child: Column(
            children: appointmentWidgets,
          ),
        );
      },
    );
  }
}
