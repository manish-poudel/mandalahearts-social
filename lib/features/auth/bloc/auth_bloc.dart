import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/auth/enums/user_profile_state.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AppUserRepository appUserRepository;
  StreamSubscription<User?>? _authSubscription;

  AuthBloc({required this.authRepository, required this.appUserRepository})
    : super(const AuthState.initial()) {
    on<AuthEvent>(_onAuthEvent);
  }

  Future<void> _onAuthEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(
      started: () async {
        emit(const AuthState.loading());
        await _authSubscription?.cancel();
        _authSubscription = authRepository.authStateChanges.listen((user) {
          add(AuthEvent.onAuthStateChange(user: user));
        });
      },
      onAuthStateChange: (user) async {
        if (user == null) {
          emit(const AuthState.unauthenticated());
        } else {
          AppUser? appUser = await appUserRepository.getUser(
            user.uid,
            forceRefresh: true,
          );

          bool hasProfile = appUser != null;
          if (!hasProfile) {
            emit(
              AuthState.authenticated(profileState: UserProfileState.noProfile),
            );
            return;
          }
          if (appUser.basicDetails == null) {
            emit(
              AuthState.authenticated(
                profileState: UserProfileState.noBasicDetails,
              ),
            );
            return;
          }
          emit(AuthState.authenticated(profileState: UserProfileState.allSet));
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
