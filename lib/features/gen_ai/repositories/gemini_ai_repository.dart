import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_map_explorer/core/constants/constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gemini_map_explorer/features/maps/repositories/map_repository/map_repository.dart';

class GeminiRepository {
  final GenerativeModel model;

  GeminiRepository()
      : model = GenerativeModel(
          systemInstruction:
              Content('user', [TextPart(Constants.systemInstructions)]),
          model: 'gemini-2.0-flash-exp',
          apiKey: dotenv.env['GEMINI_API_KEY'] ?? '',
        );

  Future<GenerateContentResponse?> generateAIResponse(String userText) async {
    try {
      final content = [
        Content('user', [TextPart(userText)])
      ];
      final GenerateContentResponse response = await model.generateContent(
        tools: [_getTool()],
        content,
        generationConfig: GenerationConfig(temperature: 2),
      );
      return response;
    } catch (e) {
      throw Exception('Error generating AI response: $e');
    }
  }

  Tool _getTool() {
    return Tool(functionDeclarations: [
      FunctionDeclaration(
        'recommend_place',
        Constants.description,
        Schema(SchemaType.object, properties: {
          'location': Schema(SchemaType.string),
          'caption': Schema(SchemaType.string),
        }, requiredProperties: [
          'location',
          'caption'
        ]),
      ),
    ]);
  }
}
