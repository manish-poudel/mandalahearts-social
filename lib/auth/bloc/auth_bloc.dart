import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  StreamSubscription<User?>? _authSubscription;

  AuthBloc({required this.authRepository}) : super(const AuthState.initial()) {
    on<AuthEvent>(_onAuthEvent);
  }

  Future<void> _onAuthEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(
      /// 🔹 App start → listen to Firebase auth changes
      started: () async {
        emit(const AuthState.loading());
        await _authSubscription?.cancel();
        _authSubscription = authRepository.authStateChanges.listen((user) {
          add(AuthEvent.onAuthStateChange(user: user));
        });
      },
      onAuthStateChange: (user) {
        if (user == null) {
          emit(const AuthState.unauthenticated());
        } else {
          emit(const AuthState.authenticated(hasProfile: true));
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
