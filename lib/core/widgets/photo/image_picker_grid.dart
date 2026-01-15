import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

/// 🔹 Photo Picker Grid with album dropdown and scrolling
class PhotoPickerGrid extends StatefulWidget {
  final Function(AssetEntity) onImageSelected;

  const PhotoPickerGrid({super.key, required this.onImageSelected});

  @override
  State<PhotoPickerGrid> createState() => _PhotoPickerGridState();
}

class _PhotoPickerGridState extends State<PhotoPickerGrid>
    with WidgetsBindingObserver {
  List<AssetPathEntity> _albums = [];
  AssetPathEntity? _selectedAlbum;
  final List<AssetEntity> _images = [];
  AssetEntity? _selectedImage;

  bool _loading = true;
  bool _loadingMore = false;
  bool _limitedAccess = false;
  bool _reachedEnd = false;
  bool _permissionDenied = false;

  int _currentPage = 0;
  final int _pageSize = 40;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadAlbums();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_loadingMore &&
          _selectedAlbum != null &&
          !_reachedEnd) {
        _loadMoreImages();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _checkPermissionAndReload() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth || permission.isLimited) {
      _permissionDenied = false;
      _limitedAccess = permission.isLimited;
      await _loadAlbums();
    }
  }

  Future<void> _loadAlbums() async {
    setState(() => _loading = true);

    final permission = await PhotoManager.requestPermissionExtend();
    if (!(permission.isAuth || permission.isLimited)) {
      setState(() {
        _loading = false;
        _permissionDenied = true; // ✅ show inline permission message
      });
      return;
    }

    _permissionDenied = false;
    _limitedAccess = permission.isLimited;

    final filterOption = FilterOptionGroup(
      orders: [const OrderOption(type: OrderOptionType.createDate, asc: false)],
    );

    _albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: false,
      filterOption: filterOption,
    );

    if (_albums.isNotEmpty) {
      _selectedAlbum = _albums.first;
      _images.clear();
      _currentPage = 0;
      _reachedEnd = false;
      await _loadImages(reset: true);
    }

    setState(() => _loading = false);
  }

  Future<void> _loadImages({bool reset = false}) async {
    if (_selectedAlbum == null) return;

    if (reset) {
      _currentPage = 0;
      _images.clear();
      _reachedEnd = false;
    }

    setState(() => _loading = true);

    final imagesPage = await _selectedAlbum!.getAssetListPaged(
      page: _currentPage,
      size: _pageSize,
    );

    if (imagesPage.isEmpty && _limitedAccess) _reachedEnd = true;

    setState(() {
      _images.addAll(imagesPage);
      if (_images.isNotEmpty && _selectedImage == null) {
        _selectedImage = _images.first;
        widget.onImageSelected(_selectedImage!);
      }
      _loading = false;
    });
  }

  Future<void> _loadMoreImages() async {
    if (_selectedAlbum == null || _reachedEnd) return;

    _loadingMore = true;
    _currentPage++;
    final moreImages = await _selectedAlbum!.getAssetListPaged(
      page: _currentPage,
      size: _pageSize,
    );

    if (moreImages.isEmpty && _limitedAccess) _reachedEnd = true;

    setState(() => _images.addAll(moreImages));
    _loadingMore = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    // ✅ Show inline permission message if denied
    if (_permissionDenied) {
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
                onPressed: () async {
                  await PhotoManager.openSetting();
                  _checkPermissionAndReload();
                },
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AssetPathEntity>(
                value: _selectedAlbum,
                items: _albums.map((album) {
                  return DropdownMenuItem(
                    value: album,
                    child: Text(
                      album.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  );
                }).toList(),
                onChanged: (album) async {
                  setState(() => _selectedAlbum = album);
                  await _loadImages(reset: true);
                },
                icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                isDense: true,
                alignment: AlignmentDirectional.centerStart,
              ),
            ),
          ),
        ),

        // Grid of thumbnails
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
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
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    final image = _images[index];
                    final isSelected = image == _selectedImage;

                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedImage = image);
                        widget.onImageSelected(image);
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

                if (_limitedAccess)
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

                if (_loadingMore)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
