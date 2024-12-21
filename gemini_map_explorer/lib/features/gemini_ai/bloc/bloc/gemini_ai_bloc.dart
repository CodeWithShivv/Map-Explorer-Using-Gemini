import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'gemini_ai_event.dart';
import 'gemini_ai_state.dart';

class GeminiAIBloc extends Bloc<GeminiAIEvent, GeminiAIState> {
  GeminiAIBloc() : super(GeminiAIInitial()) {
    Gemini.init(
      apiKey: 'AIzaSyDrowffeiU1Pl1-LXi2J3TGlQ7-0C5YgeE',
    );
    on<GenerateAIResponseEvent>(_onGenerateAIResponseEvent);
  }

  Future<void> _onGenerateAIResponseEvent(
      GenerateAIResponseEvent event, Emitter<GeminiAIState> emit) async {
    emit(GeminiAILoading());

    try {
      // Create request payload
    } on DioError catch (e) {
      emit(GeminiAIError(
          'Request failed: ${e.response?.data ?? e.message} (${e.response?.statusCode})'));
    } catch (e) {
      emit(GeminiAIError('An unexpected error occurred: $e'));
    }
  }
}
