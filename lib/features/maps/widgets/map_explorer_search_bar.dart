import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_event.dart';

class MapExplorerSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const MapExplorerSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
        hintText: 'Search for a place...',
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search,
              color: Theme.of(context).inputDecorationTheme.suffixIconColor),
          onPressed: () {
            FocusScope.of(context).unfocus();
            context.read<GeminiAIBloc>().add(
                  GenerateAIResponseEvent(searchController.text),
                );
          },
        ),
      ),
    );
  }
}
