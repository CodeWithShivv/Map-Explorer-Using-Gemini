import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_map_explorer/core/network/api_endpoints.dart';
import 'package:gemini_map_explorer/features/maps/models/maps/map_location.dart';

class MapRepository {
  final Dio _dio;

  MapRepository(this._dio);

  Future<MapLocation?> getCoordinatesFromAddress(String address) async {
    final String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
    final String url =
        '${ApiEndpoints.getCoordinates}?address=${Uri.encodeComponent(address)}&key=$googleMapsApiKey';

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;
      if (data['status'] == 'OK') {
        final location = data['results'][0]['geometry']['location'];
        final lat = location['lat'];
        final lng = location['lng'];
        return MapLocation(name: address, latitude: lat, longitude: lng);
      }
    }
    return null;
  }
}
