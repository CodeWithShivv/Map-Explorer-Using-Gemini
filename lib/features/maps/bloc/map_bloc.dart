import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gemini_map_explorer/features/maps/models/maps/map_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gemini_map_explorer/features/maps/repositories/map_repository/map_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository mapRepository;

  final TextEditingController _searchController = TextEditingController();
  late GoogleMapController controller;

  TextEditingController get searchController => _searchController;

  MapBloc(this.mapRepository) : super(MapInitial()) {
    on<MapCreatedEvent>(_onMapCreated);
    on<AddMarkerEvent>(_onAddMarker);
  }

  void _onMapCreated(MapCreatedEvent event, Emitter<MapState> emit) {
    controller = event.controller;
    emit(MapLoaded(
        controller: controller, markers: state.markers, locations: const []));
  }

  void _onAddMarker(AddMarkerEvent event, Emitter<MapState> emit) {
    final markers = Set<Marker>.from(state.markers)..add(event.marker);
    emit(MapLoaded(controller: controller, markers: markers, locations: []));
  }
}
