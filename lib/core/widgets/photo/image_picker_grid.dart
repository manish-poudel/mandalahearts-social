import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_cubit.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_state.dart';

class PhotoPickerGrid extends StatefulWidget {
  const PhotoPickerGrid({super.key});

  @override
  State<PhotoPickerGrid> createState() => _PhotoPickerGridState();
}

class _PhotoPickerGridState extends State<PhotoPickerGrid>
    with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    context.read<PhotoPickerCubit>().init();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<PhotoPickerCubit>().loadMoreImages();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<PhotoPickerCubit>().reloadAfterPermission();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoPickerCubit, PhotoPickerState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: Text("loading your photos"));
        }

        if (state.permissionDenied) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Photo Access Required",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "We need access to your photos to let you select images for your posts. Please update your permissions in settings.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () => PhotoManager.openSetting(),
                    child: const Text("Open Settings"),
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          children: [
            // Album Dropdown
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AssetPathEntity>(
                    value: state.selectedAlbum,
                    items: state.albums.map((album) {
                      return DropdownMenuItem(
                        value: album,
                        child: Text(
                          album.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                    onChanged: (album) {
                      if (album != null) {
                        context.read<PhotoPickerCubit>().selectAlbum(album);
                      }
                    },
                    icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                    isDense: true,
                    alignment: AlignmentDirectional.centerStart,
                  ),
                ),
              ),
            ),

            // Grid of thumbnails
            Column(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(2),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: state.images.length,
                  itemBuilder: (context, index) {
                    final image = state.images[index];
                    final isSelected = image == state.selectedImage;

                    return GestureDetector(
                      onTap: () {
                        context.read<PhotoPickerCubit>().selectImage(image);
                        //widget.onImageSelected(state.selectedImage!);
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: AssetEntityImage(
                              image,
                              fit: BoxFit.cover,
                              isOriginal: false,
                              thumbnailSize: const ThumbnailSize(200, 200),
                            ),
                          ),
                          if (isSelected)
                            Positioned.fill(
                              child: Container(
                                color: Colors.black.withAlpha(80),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),

                if (state.limitedAccess)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 32,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Photo access may be restricted. Please update your permissions in settings to access all photos.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () => PhotoManager.openSetting(),
                          child: const Text("Change Settings"),
                        ),
                      ],
                    ),
                  ),

                if (state.loadingMore)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
