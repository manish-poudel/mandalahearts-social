import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/photo/image_gallery_grid.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_cubit.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_state.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaPicker extends StatefulWidget {
  const MediaPicker({
    super.key,
    this.onImageSelected,
    this.viewerController,
    this.shape = ImageViewerShape.rectangle,
  });

  final Function(AssetEntity?)? onImageSelected;
  final ImageViewerController? viewerController;
  final ImageViewerShape shape;

  @override
  State<MediaPicker> createState() => _MediaPickerState();
}

class _MediaPickerState extends State<MediaPicker> {
  late final ImageViewerController _viewerController;
  final ScrollController _scrollController = ScrollController();
  bool lockScroll = false;

  @override
  void initState() {
    super.initState();
    _viewerController = widget.viewerController ?? ImageViewerController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<PhotoPickerCubit>().loadMoreImages();
      }
    });
  }

  void setLockScroll(bool locked) {
    setState(() => lockScroll = locked);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoPickerCubit, PhotoPickerState>(
      builder: (context, pickerState) {
        final selectedImage = pickerState.selectedImage;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onImageSelected?.call(selectedImage);
        });

        return SingleChildScrollView(
          controller: _scrollController,
          physics: lockScroll
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          child: Column(
            children: [
              if (selectedImage != null)
                Listener(
                  onPointerDown: (_) => setLockScroll(true),
                  onPointerUp: (_) => setLockScroll(false),
                  onPointerCancel: (_) => setLockScroll(false),
                  child: InteractiveImageViewer(
                    image: selectedImage,
                    controller: _viewerController,
                    shape: widget.shape,
                  ),
                ),

              PhotoGalleryGrid(
                onImageSelected: (_) {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
