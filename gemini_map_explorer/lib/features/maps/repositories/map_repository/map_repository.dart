import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_map_explorer/features/maps/models/maps/map_location.dart';

class MapRepository {
  final Dio _dio = Dio();

  Future<List<MapLocation>> fetchLocations(String query) async {
    final String geminiApiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    final String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

    try {
      final response = await _dio.post(
        "https://gemini.api/function_call",
        options: Options(
          headers: {'Authorization': 'Bearer $geminiApiKey'},
        ),
        data: json.encode({'query': query}),
      );

      if (response.statusCode == 200) {
        List data = response.data['locations'];
        return data.map((json) => MapLocation.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load locations');
      }
    } catch (e) {
      throw Exception('Failed to load locations: $e');
    }
  }
}
