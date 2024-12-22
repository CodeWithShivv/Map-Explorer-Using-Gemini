import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_map_explorer/features/maps/widgets/floating_action_button.dart';
import 'package:gemini_map_explorer/features/maps/widgets/map_explorer_app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_bloc.dart';
import 'package:gemini_map_explorer/features/gen_ai/bloc/gemini_ai_state.dart';
import 'package:gemini_map_explorer/features/maps/bloc/map_bloc.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeminiAIBloc, GeminiAIState>(
      builder: (BuildContext context, aiState) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  pinned: true,
                  delegate: _MapExplorerPinnedHeader(
                      maxExtentValue: calculateAppBarHeight(context, aiState),
                      minExtentValue: calculateAppBarHeight(context, aiState))),
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    BlocBuilder<MapBloc, MapState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            onMapCreated: (controller) {
                              context.read<MapBloc>().controller = controller;
                              context
                                  .read<MapBloc>()
                                  .add(MapCreatedEvent(controller));
                            },
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(0, 0), // Center of the world map
                              zoom: 2.0,
                            ),
                            markers: state.markers,
                            myLocationEnabled: true,
                            compassEnabled: true,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: const FloatingActionButtonWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
      listener: (BuildContext context, GeminiAIState aiState) {
        if (aiState is GeminiAISuccess) {
          _navigateToLocation(context, aiState.location, aiState.caption);
        }
      },
    );
  }

  double calculateAppBarHeight(BuildContext context, GeminiAIState aiState) {
    final mediaQuery = MediaQuery.of(context);
    double baseHeight = mediaQuery.size.height * 0.20;

    // Calculate extra height based on caption length
    double additionalHeight = 0.0;
    if (aiState is GeminiAISuccess && aiState.caption.isNotEmpty) {
      // Assuming ~40 characters fit in a single line. Adjust as necessary.
      int lines = (aiState.caption.length / 40).ceil();
      additionalHeight = lines * 25.0; // 25px per line height
    }

    return baseHeight + additionalHeight;
  }

  void _navigateToLocation(
      BuildContext context, String location, String caption) {
    final List<String> latLng = location.split(',');
    final double latitude = double.parse(latLng[0]);
    final double longitude = double.parse(latLng[1]);

    context.read<MapBloc>().controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 7.0,
            ),
          ),
        );

    final marker = Marker(
      markerId: MarkerId(location),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: caption),
    );

    context.read<MapBloc>().add(AddMarkerEvent(marker));
  }
}

class _MapExplorerPinnedHeader extends SliverPersistentHeaderDelegate {
  final double minExtentValue;
  final double maxExtentValue;

  _MapExplorerPinnedHeader({
    required this.minExtentValue,
    required this.maxExtentValue,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return MapExplorerAppBar();
  }

  @override
  double get maxExtent => maxExtentValue;

  @override
  double get minExtent => minExtentValue;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}
