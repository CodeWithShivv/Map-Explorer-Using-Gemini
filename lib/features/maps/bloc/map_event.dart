part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapCreatedEvent extends MapEvent {
  final GoogleMapController controller;

  const MapCreatedEvent(this.controller);

  @override
  List<Object> get props => [controller];
}

class AddMarkerEvent extends MapEvent {
  final Marker marker;

  const AddMarkerEvent(this.marker);

  @override
  List<Object> get props => [marker];
}

class AddMarkersEvent extends MapEvent {
  final List<Marker> markers;

  const AddMarkersEvent(this.markers);

  @override
  List<Object> get props => [markers];
}

class FetchLocations extends MapEvent {
  final String query;

  const FetchLocations(this.query);

  @override
  List<Object> get props => [query];
}
