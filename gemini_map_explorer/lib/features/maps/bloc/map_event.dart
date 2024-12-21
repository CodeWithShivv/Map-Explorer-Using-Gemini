abstract class MapEvent {}

class FetchLocations extends MapEvent {
  final String query;
  FetchLocations(this.query);
}
