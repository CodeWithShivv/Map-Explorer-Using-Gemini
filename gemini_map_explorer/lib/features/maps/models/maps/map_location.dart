import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_location.freezed.dart'; // Generated file for immutability, equality, etc.
part 'map_location.g.dart'; // Generated file for JSON serialization/deserialization.

@freezed
class MapLocation with _$MapLocation {
  const factory MapLocation({
    required String name,
    required double latitude,
    required double longitude,
  }) = _MapLocation;

  // Adds support for JSON (de)serialization
  factory MapLocation.fromJson(Map<String, dynamic> json) =>
      _$MapLocationFromJson(json);
}
