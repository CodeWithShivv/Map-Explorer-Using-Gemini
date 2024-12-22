import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_event.dart';

// Bottom Sheet grid options for (existing presets in constants.presets )

class GridOption extends StatelessWidget {
  final String title;
  final String query;

  const GridOption({
    super.key,
    required this.title,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        FocusScope.of(context).unfocus();
        context.read<GeminiAIBloc>().add(GenerateAIResponseEvent(query));
      },
      child: Card(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
