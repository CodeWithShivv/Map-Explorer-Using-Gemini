import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_event.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_state.dart';
import 'package:gemini_map_explorer/features/gen_ai/repositories/gemini_ai_repository.dart';
import 'package:gemini_map_explorer/features/maps/models/maps/map_location.dart';
import 'package:gemini_map_explorer/features/maps/repositories/map_repository/map_repository.dart';

class GeminiAIBloc extends Bloc<GeminiAIEvent, GeminiAIState> {
  final GeminiRepository geminiRepository;
  final MapRepository mapRepository;
  GeminiAIBloc(this.mapRepository, this.geminiRepository)
      : super(GeminiAIInitial()) {
    on<GenerateAIResponseEvent>(_onGenerateAIResponseEvent);
  }

  Future<void> _onGenerateAIResponseEvent(
      GenerateAIResponseEvent event, Emitter<GeminiAIState> emit) async {
    emit(GeminiAILoading());

    try {
      final response =
          await geminiRepository.generateAIResponse(event.userText);

      if (response != null && response.functionCalls.isNotEmpty) {
        final location =
            response.functionCalls.first.args['location'].toString();
        final caption = response.functionCalls.first.args['caption'].toString();

        // Use the MapRepository to get coordinates
        final MapLocation? coordinates =
            await mapRepository.getCoordinatesFromAddress(location);

        if (coordinates != null) {
          emit(GeminiAISuccess(
              '${coordinates.latitude},${coordinates.longitude}', caption));
        } else {
          emit(GeminiAIError(
              'Could not find coordinates for location: $location'));
        }
      }
    } catch (e) {
      emit(GeminiAIError('An unexpected error occurred: $e'));
    }
  }
}
