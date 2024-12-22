// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapLocationImpl _$$MapLocationImplFromJson(Map<String, dynamic> json) =>
    _$MapLocationImpl(
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$MapLocationImplToJson(_$MapLocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
