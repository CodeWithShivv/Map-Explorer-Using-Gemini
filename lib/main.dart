// Main entry point
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_map_explorer/core/di/service_locator.dart';
import 'package:gemini_map_explorer/core/routes/routes.dart';
import 'package:gemini_map_explorer/core/theme/app_theme.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/repositories/gemini_ai_repository.dart';
import 'package:gemini_map_explorer/features/maps/bloc/map_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/maps/repositories/map_repository/map_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeminiAIBloc>(
          create: (context) =>
              GeminiAIBloc(getIt<MapRepository>(), getIt<GeminiRepository>()),
        ),
        BlocProvider<MapBloc>(
          create: (context) => MapBloc(getIt<MapRepository>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Map Explorer',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
