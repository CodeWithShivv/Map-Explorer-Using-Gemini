// Main entry point
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_map_explorer/core/routes/routes.dart';
import 'package:gemini_map_explorer/features/gemini_ai/bloc/bloc/gemini_ai_bloc.dart';
import 'package:gemini_map_explorer/features/maps/bloc/map_bloc.dart';

import 'features/maps/repositories/map_repository/map_repository.dart';

Future<void> main() async {
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeminiAIBloc>(
          create: (context) => GeminiAIBloc(),
        ),
        BlocProvider<MapBloc>(
          create: (context) => MapBloc(MapRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Map Explorer',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
