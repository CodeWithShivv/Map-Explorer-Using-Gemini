part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  final Set<Marker> markers;

  const MapState({this.markers = const {}});

  @override
  List<Object> get props => [markers];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final GoogleMapController controller;

  const MapLoaded(
      {required this.controller,
      super.markers,
      required List<MapLocation> locations});

  @override
  List<Object> get props => [controller, markers];
}

class MapError extends MapState {
  final String error;
  const MapError(this.error);
}
