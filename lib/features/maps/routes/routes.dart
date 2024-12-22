import 'package:flutter/material.dart';
import 'package:gemini_map_explorer/features/maps/views/maps_view.dart';

class MapsRoutes {
  static const String mapsHome = '/maps';
  static const String mapDetail = '/maps/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapsHome:
        return MaterialPageRoute(builder: (_) => const MapsView());
      case mapDetail:
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: Center(child: Text('404'))));
    }
  }
}
