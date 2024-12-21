// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MapLocation _$MapLocationFromJson(Map<String, dynamic> json) {
  return _MapLocation.fromJson(json);
}

/// @nodoc
mixin _$MapLocation {
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this MapLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MapLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapLocationCopyWith<MapLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapLocationCopyWith<$Res> {
  factory $MapLocationCopyWith(
          MapLocation value, $Res Function(MapLocation) then) =
      _$MapLocationCopyWithImpl<$Res, MapLocation>;
  @useResult
  $Res call({String name, double latitude, double longitude});
}

/// @nodoc
class _$MapLocationCopyWithImpl<$Res, $Val extends MapLocation>
    implements $MapLocationCopyWith<$Res> {
  _$MapLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapLocationImplCopyWith<$Res>
    implements $MapLocationCopyWith<$Res> {
  factory _$$MapLocationImplCopyWith(
          _$MapLocationImpl value, $Res Function(_$MapLocationImpl) then) =
      __$$MapLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double latitude, double longitude});
}

/// @nodoc
class __$$MapLocationImplCopyWithImpl<$Res>
    extends _$MapLocationCopyWithImpl<$Res, _$MapLocationImpl>
    implements _$$MapLocationImplCopyWith<$Res> {
  __$$MapLocationImplCopyWithImpl(
      _$MapLocationImpl _value, $Res Function(_$MapLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$MapLocationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapLocationImpl implements _MapLocation {
  const _$MapLocationImpl(
      {required this.name, required this.latitude, required this.longitude});

  factory _$MapLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapLocationImplFromJson(json);

  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'MapLocation(name: $name, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapLocationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, latitude, longitude);

  /// Create a copy of MapLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapLocationImplCopyWith<_$MapLocationImpl> get copyWith =>
      __$$MapLocationImplCopyWithImpl<_$MapLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapLocationImplToJson(
      this,
    );
  }
}

abstract class _MapLocation implements MapLocation {
  const factory _MapLocation(
      {required final String name,
      required final double latitude,
      required final double longitude}) = _$MapLocationImpl;

  factory _MapLocation.fromJson(Map<String, dynamic> json) =
      _$MapLocationImpl.fromJson;

  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of MapLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapLocationImplCopyWith<_$MapLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
