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
String usercollectionname = 'users';
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(usercollectionname)
          .doc(userId)
          .collection('Appointments')
          .where('appointmentDate', 
       isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(selectedDate.year, selectedDate.month, selectedDate.day)),
       isLessThan: Timestamp.fromDate(DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1)))

          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        print("Selected Date: ${selectedDate.day.toString()}");
print(Timestamp.fromDate(DateTime(selectedDate.year, selectedDate.month, selectedDate.day - 1)));
print(Timestamp.fromDate(DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1)));

print("USERID: $userId");
        List<Widget> appointmentWidgets = snapshot.data!.docs.map((doc) {
          var appointmentData = doc.data() as Map<String, dynamic>;
          
          var iconCodePoint = (appointmentData['iconCodePoint']);
          var icon = IconData(iconCodePoint, fontFamily: 'UniconsLine', fontPackage: 'unicons');
          var name = appointmentData['iconName'];
          var description = appointmentData['iconDescription']; // Hinzugefügt für Vollständigkeit
          var appointmentDate = (appointmentData['appointmentDate'] as Timestamp).toDate();
print("ICON: $iconCodePoint");
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
