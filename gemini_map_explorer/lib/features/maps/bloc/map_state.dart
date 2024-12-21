import 'package:gemini_map_explorer/features/maps/models/maps/map_location.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final List<MapLocation> locations;
  MapLoaded(this.locations);
}

class MapError extends MapState {
  final String error;
  MapError(this.error);
}
