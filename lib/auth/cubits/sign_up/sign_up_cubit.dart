import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mandalahearts/auth/cubits/sign_up/sign_up_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit(this._authRepository) : super(const SignUpState.initial());

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      emit(const SignUpState.loading());
      await _authRepository.signUpWithEmail(email: email, password: password);
      emit(const SignUpState.success());
    } on FirebaseAuthException catch (e) {
      emit(SignUpState.error(message: _mapFirebaseError(e.code)));
    } catch (_) {
      emit(
        const SignUpState.error(
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'An account with this email already exists.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'weak-password':
        return 'Password should be at least 6 characters.';
      case 'operation-not-allowed':
        return 'Email/password sign-up is currently disabled.';
      case 'network-request-failed':
        return 'No internet connection. Please check your network.';
      default:
        return 'Unable to create account. Please try again.';
    }
  }
}
