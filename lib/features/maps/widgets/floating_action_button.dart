import 'package:flutter/material.dart';
import 'package:gemini_map_explorer/features/maps/widgets/bottom_sheet_content.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.8, // Responsive width
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const BottomSheetContent(),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Take me somewhere....',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
