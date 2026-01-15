import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

import 'photo_picker_state.dart';

class PhotoPickerCubit extends Cubit<PhotoPickerState> {
  PhotoPickerCubit() : super(const PhotoPickerState());

  static const int _pageSize = 40;
  int _currentPage = 0;

  Future<void> init() async {
    emit(state.copyWith(loading: true));

    final permission = await PhotoManager.requestPermissionExtend();
    if (!(permission.isAuth || permission.isLimited)) {
      emit(state.copyWith(loading: false, permissionDenied: true));
      return;
    }

    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: false,
      filterOption: FilterOptionGroup(
        orders: [
          const OrderOption(type: OrderOptionType.createDate, asc: false),
        ],
      ),
    );

    emit(
      state.copyWith(
        albums: albums,
        selectedAlbum: albums.firstOrNull,
        limitedAccess: permission.isLimited,
        permissionDenied: false,
      ),
    );

    await loadImages(reset: true);
  }

  Future<void> reloadAfterPermission() async => init();

  Future<void> loadImages({bool reset = false}) async {
    final album = state.selectedAlbum;
    if (album == null) return;

    if (reset) {
      _currentPage = 0;
      emit(state.copyWith(images: [], reachedEnd: false, loading: true));
    }

    final page = await album.getAssetListPaged(
      page: _currentPage,
      size: _pageSize,
    );

    emit(
      state.copyWith(
        images: [...state.images, ...page],
        selectedImage: state.selectedImage ?? page.firstOrNull,
        loading: false,
        reachedEnd: page.isEmpty && state.limitedAccess,
      ),
    );
  }

  Future<void> loadMoreImages() async {
    if (state.loadingMore || state.reachedEnd) return;

    emit(state.copyWith(loadingMore: true));
    _currentPage++;

    final more = await state.selectedAlbum!.getAssetListPaged(
      page: _currentPage,
      size: _pageSize,
    );

    emit(
      state.copyWith(
        images: [...state.images, ...more],
        loadingMore: false,
        reachedEnd: more.isEmpty && state.limitedAccess,
      ),
    );
  }

  void selectAlbum(AssetPathEntity album) {
    emit(state.copyWith(selectedAlbum: album, selectedImage: null));
    loadImages(reset: true);
  }

  void selectImage(AssetEntity image) {
    emit(state.copyWith(selectedImage: image));
  }
}
