import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  // Create a GoogleMapController to interact with the map
  late GoogleMapController _controller;

  // Initial camera position
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194), // Coordinates for San Francisco
    zoom: 10.0,
  );

  // Set of markers to add to the map
  Set<Marker> _markers = {};

  // Function to handle the map creation
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    setState(() {
      _markers.add(
        const Marker(
          markerId: MarkerId('sf_marker'),
          position: LatLng(37.7749, -122.4194), // San Francisco coordinates
          infoWindow: InfoWindow(title: 'San Francisco'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        backgroundColor: Colors.green,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialPosition,
        markers: _markers,
        myLocationEnabled: true, // Enable user's location (optional)
        compassEnabled: true, // Enable compass (optional)
      ),
    );
  }
}
