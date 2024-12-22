import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_map_explorer/core/widgets/animated_text.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_event.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_state.dart';


class MapExplorerAppBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  MapExplorerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiAIBloc, GeminiAIState>(
      builder: (context, aiState) {
        return AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: SafeArea(
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
                  TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 14),
                      hintText: 'Search for a place...',
                      fillColor: const Color(0xff181818),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.read<GeminiAIBloc>().add(
                                GenerateAIResponseEvent(searchController.text),
                              );
                        },
                      ),
                    ),
                  ),
                  if (aiState is GeminiAISuccess &&
                      aiState.caption.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    AnimatedText(
                      duration: const Duration(milliseconds: 60),
                      text: aiState.caption,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
