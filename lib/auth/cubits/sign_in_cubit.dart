import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/auth/cubits/sign_in_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;

  SignInCubit(this._authRepository) : super(const SignInState.initial());

  Future<void> signInWithEmail(String email, String password) async {
    emit(const SignInState.loading());
    try {
      await _authRepository.signInWithEmail(email: email, password: password);
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.error(message: e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const SignInState.loading());
    try {
      await _authRepository.signInWithGoogle();
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.error(message: e.toString()));
    }
  }
}
