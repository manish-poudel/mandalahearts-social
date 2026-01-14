import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mandalahearts/features/sign_in/cubits/sign_in_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;

  SignInCubit(this._authRepository) : super(const SignInState.initial());

  Future<void> signInWithEmail(String email, String password) async {
    try {
      emit(const SignInState.loading());

      await _authRepository.signInWithEmail(email: email, password: password);

      emit(const SignInState.success());
    } on FirebaseAuthException catch (e) {
      emit(SignInState.error(message: _mapFirebaseError(e.code)));
    } catch (_) {
      emit(
        const SignInState.error(
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found for this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'network-request-failed':
        return 'No internet connection. Please check your network.';
      case 'invalid-credential':
        return 'Incorrect email or password. If you previously signed up with Google, please use the "Continue with Google" button.';
      default:
        return 'Unable to sign in. Please try again.';
    }
  }
}
