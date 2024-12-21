import 'package:bloc/bloc.dart';
import 'package:gemini_map_explorer/features/maps/repositories/map_repository/map_repository.dart';
import 'map_event.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository mapRepository;

  MapBloc(this.mapRepository) : super(MapInitial()) {
    on<FetchLocations>((event, emit) async {
      emit(MapLoading());
      try {
        final locations = await mapRepository.fetchLocations(event.query);
        emit(MapLoaded(locations));
      } catch (e) {
        emit(MapError(e.toString()));
      }
    });
  }
}
