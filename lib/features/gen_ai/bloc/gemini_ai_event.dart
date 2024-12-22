import 'package:equatable/equatable.dart';

abstract class GeminiAIEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenerateAIResponseEvent extends GeminiAIEvent {
  final String userText;

  GenerateAIResponseEvent(this.userText);

  @override
  List<Object?> get props => [userText];
}

