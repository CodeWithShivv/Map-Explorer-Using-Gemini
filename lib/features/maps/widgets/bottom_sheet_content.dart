import 'package:flutter/material.dart';
import 'package:gemini_map_explorer/core/constants/constants.dart';
import 'package:gemini_map_explorer/features/maps/widgets/grid_option.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.25,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3,
        children: Constants.presets.map((preset) {
          return GridOption(title: preset[0], query: preset[1]);
        }).toList(),
      ),
    );
  }
}
