import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/profile_view/cubits/profile_view_state.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';

class ProfileCubit extends Cubit<ProfileViewState> {
  ProfileCubit(this._repo) : super(const ProfileViewState.loading());

  final AppUserRepository _repo;
  StreamSubscription<AppUser?>? _sub;

  Future<void> init({required String userId, required ProfileMode mode}) async {
    _sub?.cancel();
    emit(const ProfileViewState.loading());

    if (mode == ProfileMode.currentUser) {
      _listenToCurrentUser(userId, mode);
    } else {
      await _loadPublicUser(userId, mode);
    }
  }

  void _listenToCurrentUser(String userId, ProfileMode mode) {
    _sub = _repo
        .streamUser(userId)
        .listen(
          (user) {
            if (user == null) {
              emit(const ProfileViewState.error('User not found'));
              return;
            }
            emit(ProfileViewState.loaded(user: user, mode: mode));
          },
          onError: (e) {
            emit(ProfileViewState.error(e.toString()));
          },
        );
  }

  Future<void> _loadPublicUser(String userId, ProfileMode mode) async {
    try {
      final user = await _repo.getUser(userId, forceRefresh: true);

      if (user == null) {
        emit(const ProfileViewState.error('User not found'));
        return;
      }
      emit(ProfileViewState.loaded(user: user, mode: mode));
    } catch (e) {
      emit(ProfileViewState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
