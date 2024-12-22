import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_map_explorer/core/widgets/animated_text.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_state.dart';
import 'package:gemini_map_explorer/features/maps/widgets/map_explorer_search_bar.dart';

class MapExplorerAppBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  MapExplorerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          color: Colors.black,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to Map Explorer!',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    MapExplorerSearchBar(searchController: searchController),
                    const SizedBox(height: 10),
                    BlocBuilder<GeminiAIBloc, GeminiAIState>(
                      builder: (context, aiState) {
                        if (aiState is GeminiAILoading) {
                          return const LinearProgressIndicator();
                        } else if (aiState is GeminiAISuccess) {
                          return AnimatedText(
                            style: const TextStyle(color: Colors.white),
                            text: aiState.caption,
                          );
                        } else if (aiState is GeminiAIError) {
                          return Text(
                            aiState.message,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
