import 'package:flutter/material.dart';
import 'package:gemini_map_explorer/features/maps/routes/routes.dart';
import 'package:gemini_map_explorer/features/maps/views/maps_view.dart';

class AppRoutes {
  static const String home = '/';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const MapsView());

      case MapsRoutes.mapsHome:
        return MapsRoutes.generateRoute(settings); // Delegating to MapsRoutes

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: Text('404 - Route Not Found'))));
    }
  }
}
