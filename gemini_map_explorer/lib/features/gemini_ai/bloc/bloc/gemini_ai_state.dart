import 'package:equatable/equatable.dart';

abstract class GeminiAIState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GeminiAIInitial extends GeminiAIState {}

class GeminiAILoading extends GeminiAIState {}

class GeminiAIError extends GeminiAIState {
  final String error;

  GeminiAIError(this.error);

  @override
  List<Object?> get props => [error];
}
