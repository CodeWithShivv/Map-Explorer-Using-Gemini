import 'package:gemini_map_explorer/features/gen_ai/repositories/gemini_ai_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:gemini_map_explorer/features/maps/repositories/map_repository/map_repository.dart';

final GetIt getIt = GetIt.instance;

Future setupLocator() async {
  getIt.registerLazySingleton<MapRepository>(() => MapRepository());
  getIt.registerLazySingleton<GeminiRepository>(() => GeminiRepository());
  return;
}
