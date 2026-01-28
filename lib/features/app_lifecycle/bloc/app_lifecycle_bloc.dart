import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/app_lifecycle/enums/user_profile_state.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/repository/app_config_repository.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';

import 'app_lifecycle_event.dart';
import 'app_lifecycle_state.dart';

class AppLifeCycleBloc extends Bloc<AppLifeCycleEvent, AppLifeCycleState> {
  AuthRepository authRepository;
  AppUserRepository appUserRepository;
  PostRepository postRepository;
  AppConfigRepository appConfigRepository;

  StreamSubscription<User?>? _authSubscription;

  AppLifeCycleBloc({
    required this.authRepository,
    required this.appUserRepository,
    required this.postRepository,
    required this.appConfigRepository,
  }) : super(const AppLifeCycleState.initial()) {
    on<AppLifeCycleEvent>(_appEvents);
  }

  Future<void> _appEvents(
    AppLifeCycleEvent event,
    Emitter<AppLifeCycleState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const AppLifeCycleState.loading());
        await _authSubscription?.cancel();
        _authSubscription = authRepository.authStateChanges.listen((user) {
          add(AppLifeCycleEvent.onAuthStateChange(user: user));
        });
      },
      onAuthStateChange: (user) async {
        if (user == null) {
          debugPrint("Clear all cache");
          appUserRepository.clearCache();
          postRepository.clearAllCache();
          emit(const AppLifeCycleState.unauthenticated());
        } else {
          AppUser? appUser = await appUserRepository.getUser(
            user.uid,
            forceRefresh: true,
          );
          bool hasProfile = appUser != null;
          if (!hasProfile) {
            emit(
              AppLifeCycleState.authenticated(
                profileState: UserProfileState.noProfile,
              ),
            );
            return;
          }
          if (appUser.basicDetails == null) {
            emit(
              AppLifeCycleState.authenticated(
                profileState: UserProfileState.noBasicDetails,
              ),
            );
            return;
          }
          emit(
            AppLifeCycleState.authenticated(
              profileState: UserProfileState.allSet,
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
