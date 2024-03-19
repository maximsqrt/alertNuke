import 'package:alertnukeapp/common/savediconsprovider.dart';
import 'package:alertnukeapp/features/calendar/presentation/day/appointments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsList extends StatelessWidget {

final DateTime selectedDate;

  AppointmentsList({Key? key, required this.selectedDate}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<User?>(context)?.uid;

      // Anpassung der Abfrage, um Termine für den spezifischen Tag zu erhalten
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
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var documents = snapshot.data!.docs;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            var appointmentData = documents[index].data() as Map<String, dynamic>;
            // Erstelle ein IconAppointment-Objekt aus den Daten
            var appointment = IconAppointment(
              iconWithName: IconWithName(
                icon: IconData(appointmentData['iconCodePoint'], fontFamily: appointmentData['iconFontFamily'], fontPackage: appointmentData['iconFontPackage']),
                name: appointmentData['iconName'],
                iconDescription: appointmentData['iconDescription'],
              ),
              appointmentDate: (appointmentData['appointmentDate'] as Timestamp).toDate(),
              appointmentDescription: appointmentData['appointmentDescription'],
            );

            // An dieser Stelle kannst du Widgets zurückgeben, die das IconAppointment-Objekt anzeigen
            return ListTile(
              leading: Icon(appointment.iconWithName.icon),
              title: Text(appointment.iconWithName.name),
              subtitle: Text("${appointment.appointmentDate} - ${appointment.appointmentDescription}"),
            );
          },
        );
      },
    );
  }
}
