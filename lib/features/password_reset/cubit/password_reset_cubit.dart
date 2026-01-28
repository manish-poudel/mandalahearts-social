import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mandalahearts/models/app_config/app_config.dart';
import 'package:mandalahearts/models/async/async_state.dart';
import 'package:mandalahearts/repository/app_config_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

class PasswordResetCubit extends Cubit<AsyncState> {
  final AuthRepository _authRepository;
  final AppConfigRepository _appConfigRepository;

  PasswordResetCubit(this._authRepository, this._appConfigRepository)
    : super(const AsyncState.initial());

  Future<void> sendPasswordReset(String email) async {
    if (email.trim().isEmpty) {
      emit(const AsyncState.error('Please enter your email'));
      return;
    }
    emit(const AsyncState.loading());
    try {
      PasswordReset passwordReset = await _appConfigRepository
          .getPasswordReset();

      await _authRepository.sendPasswordResetEmail(
        email,
        passwordReset.passwordResetUrl,
        passwordReset.handleCodeInApp,
      );
      emit(const AsyncState.success());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      emit(AsyncState.error('Unable to send reset link. Try gain'));
    } catch (_) {
      emit(const AsyncState.error('Something went wrong'));
    }
  }
}
