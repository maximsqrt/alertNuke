import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// Importiere weitere benötigte Pakete hier

class MapCalendar extends StatefulWidget {
  const MapCalendar({Key? key}) : super(key: key);

  @override
  State<MapCalendar> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapCalendar> {
  MapController mapController = MapController();
  LatLng? _locationData; // Diese Variable könnte noch initialisiert oder aktualisiert werden müssen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: _locationData ?? const LatLng(48.137154, 11.576124),
              zoom: 18.0,
              backgroundColor: Colors.white,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
          children: [
    TileLayer(
      urlTemplate: "https://tile.thunderforest.com/spinal-map/{z}/{x}/{y}.png?apikey=b3250019b1cf4c329cd29f1166421e6a",
      additionalOptions: {
        'apikey': 'b3250019b1cf4c329cd29f1166421e6a',
      },
    ),
          Positioned(
            right: 0,
            top: (MediaQuery.of(context).size.height - 80) / 2,
            child: Container(
              width: 50,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Füge hier Widgets hinzu, die in diesem Container erscheinen sollen
                ],
              ),
            ),
          ),
        ],
      ),
    ]));
  }
}
