import 'package:equatable/equatable.dart';

abstract class GeminiAIState {}

class GeminiAIInitial extends GeminiAIState {}

class GeminiAILoading extends GeminiAIState {}

class GeminiAIError extends GeminiAIState {
  final String message;

  GeminiAIError(this.message);
}

class GeminiAISuccess extends GeminiAIState {
  final String location;

  final String caption;

  GeminiAISuccess(this.location, this.caption);
}
