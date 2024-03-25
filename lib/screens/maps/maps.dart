import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(48.8566, 2.3522), // Geographische Koordinaten von Paris
            zoom: 12,
          ),
        ),
      ),
    );
  }
}
