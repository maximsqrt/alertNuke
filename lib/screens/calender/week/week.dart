import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/wrapper.dart';


// Main class for the WeekCalendar widget, a stateless widget representing a week calendar UI
class WeekCalendar extends StatelessWidget {
  // Constructor for WeekCalendar
   WeekCalendar({Key? key}) : super(key: key);

  // List of day names for the week, starting with 'Time'
  final List<String> dayNames = ['Time', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  // Build method to create the widget tree
  @override
  Widget build(BuildContext context) {
    // Scaffold widget, providing basic material design structure
    return 
      // Body of the scaffold, containing the main UI components
    SingleChildScrollView(
        // Container representing the entire screen
        child: Container(
          // Set the height and width of the container to match the screen dimensions
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // Decoration for a gradient background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],
              tileMode: TileMode.repeated,
              stops: [0.1, 0.7],
              transform: GradientRotation(45 * 3.1415926535897932 / 180),
            ),
          ),
          // Padding to provide space around the contents of the container
          padding: const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 0),
          // Column to organize child widgets vertically
          child: Column(
            children: [
              // LogoWidget, a widget displaying an image logo
              
              // SizedBox for adding vertical spacing between widgets
              const SizedBox(height: 10),
              // WeekGrid, a widget displaying a grid of days in the week
              WeekGrid(dayNames: dayNames),
              // Replace LogoBottomNavigationBar with your appropriate widget.
            ],
          ),
        ),
      );
  }
}



// Widget for displaying a grid of days in the week
class WeekGrid extends StatelessWidget {
  // List of day names for the week
  final List<String> dayNames;

  // Constructor for WeekGrid
  const WeekGrid({required this.dayNames});

  // Build method to create the widget tree
  @override
  Widget build(BuildContext context) {
    // GridView.builder for creating a scrollable grid of day items
    return GridView.builder(
      // Number of items in the grid equal to the length of dayNames
      itemCount: dayNames.length,
      // Grid delegate specifying the layout of the grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        mainAxisSpacing: 5,
        crossAxisSpacing: 8,
      ),
      // Item builder for constructing each grid item
      itemBuilder: (context, index) {
        // Column widget for organizing child widgets vertically
        return const DayGridItem();
      },
    );
  }
}

// Widget representing a single day item in the grid
class DayGridItem extends StatelessWidget {
  // Constructor for DayGridItem
  const DayGridItem({Key? key}) : super(key: key);

  // Build method to create the widget tree
  @override
  Widget build(BuildContext context) {
    // Column widget for organizing child widgets vertically
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Text widget displaying the day name
        const Text(
          'Day', // Placeholder text, replace with actual day name
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        // SizedBox for adding vertical spacing between widgets
        const SizedBox(height: 1),
        // Container representing the visual representation of a day item
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF568493),
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
      ],
    );
  }
}