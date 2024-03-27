import 'package:alertnukeapp/common/savediconsprovider.dart';
import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/features/calendar/domain/icon_appointment.dart';
import 'package:alertnukeapp/features/calendar/presentation/day/appointments.dart';
import 'package:alertnukeapp/features/calendar/presentation/day/displayappointment.dart';
import 'package:alertnukeapp/features/calendar/presentation/day/symboltap.dart';
import 'package:alertnukeapp/features/calendar/presentation/day/timecontainer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

class DayCalendar extends StatefulWidget {
  final int selectedDay;
  final int monthNumber;

  const DayCalendar(
      {Key? key, required this.selectedDay, required this.monthNumber})
      : super(key: key);

  @override
  _DayCalendarState createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  final ScrollController _timeController = ScrollController();
  final ScrollController _dayController = ScrollController();
  late DateTime selectedDate;
  DateTime currentDate = DateTime.now();
  late List<String> weekNames;

  @override
  void initState() {
    currentDate =
        DateTime(currentDate.year, widget.monthNumber, widget.selectedDay);
    super.initState();
    selectedDate =
        DateTime(DateTime.now().year, widget.monthNumber, widget.selectedDay);
    weekNames = ['Time', widget.selectedDay.toString()];


  }
  void _updateDate(int daysToAdd) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: daysToAdd));
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    

    
    Scaffold(
      backgroundColor: BackgroundColor.primaryColor,
      appBar: AppBar(
        title: Text(
          '${DateFormat('EEEE').format(selectedDate)}, ${selectedDate.day.toString()} ${DateFormat('MMMM y').format(currentDate)}',
          style: const TextStyle(fontSize: 18, color: FancyFontColor.primaryColor)
          
        
        ),
         flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors:  [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],

            
            
            ),
            ),
          ),
        leading: IconButton(
          icon: const Icon(UniconsLine.arrow_down),
          onPressed: () => _updateDate(-1), // Tag zurück
      ),
       actions: <Widget>[
          IconButton(
            icon: const Icon(UniconsLine.arrow_up),
            onPressed: () => _updateDate(1), // Tag vor
             ),
        ],
      ),
      body: SingleChildScrollView(
        // Scroll-View für den gesamten Bildschirm
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 0),
          child: IntrinsicHeight(
            child: Container(
                  // Festgelegte Breite für das Zeit-Widget, um es nicht-scrollbar zu machen
                  width: MediaQuery.of(context).size.width, // Beispielbreite, anpassen nach Bedarf
                  height: 48 * 39.5, // Deine berechnete Höhe
                  decoration: BoxDecoration(
                    gradient: SettingsBackgroundColor
                        .linearGradient(), // Beispielhintergrundfarbe
                  ),
                  child: TimeContainer(timeController: _timeController, selectedDate: selectedDate,),
                ),
          ),
        ),
      ),
    );
    
  }

  ///TappedUpDetails
  void _handleTap(BuildContext context, TapUpDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.globalToLocal(details.localPosition);
    final containerHeight =
        MediaQuery.of(context).size.height; // Container-Höhe anpassen
    const totalSlots = 48; // 24 Stunden * 2 Slots pro Stunde
    final slotHeight = containerHeight / totalSlots; // Höhe jedes Slots
    final tappedSlot =
        (position.dy / slotHeight).floor(); // Bestimme den getappten Slot

    final hour = tappedSlot ~/ 4;
    final minute = (tappedSlot % 2) * 30;

    print(
        "Tapped slot: $tappedSlot, Time: ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}");

    _showIconSelectionDialog(context, hour, minute, position.dy);
  }

  Future<void> _showIconSelectionDialog(
      BuildContext context, int hour, int minute, double position) async {
    final IconWithName? selectedIcon = await showDialog<IconWithName>(
      context: context,
      builder: (context) => const SymbolTap(),
    );

    if (selectedIcon != null) {
      print("Selected Icon: ${selectedIcon.name} for time $hour:$minute");

      // Datum und Uhrzeit für den Termin festlegen
      DateTime appointmentDate = DateTime(currentDate.year, widget.monthNumber,
          widget.selectedDay, hour, minute);

      // Benutzer-ID abrufen
      String? userId =
          await FirebaseIconAppointmentRepository().getCurrentUserId();

      if (userId != null) {
        // IconAppointment Instanz erstellen
        IconAppointment appointment = IconAppointment(
          iconWithName: selectedIcon,
          appointmentDate: appointmentDate,
          iconPosition: position,
          appointmentDescription:
              "Beschreibung hier einfügen", 
              // Füge eine Möglichkeit hinzu, eine Beschreibung zu erfassen
        );

        // Termin in Firebase speichern
        await FirebaseIconAppointmentRepository()
            .addIconAppointment(userId, appointment);

        // Optional: Bestätigung anzeigen oder den State aktualisieren
      } else {
        // Handle User not logged in
      }
    }
  }
}

class DayContainer extends StatelessWidget {
  final ScrollController dayController;
  final DateTime selectedDate;
  DayContainer(
      {Key? key, required this.dayController, required this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MonthColor.fancyLinearGradient(),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: SingleChildScrollView(
        controller: dayController,
        child: AppointmentsDisplay(selectedDate: selectedDate),
      ),
    );
  }
}
