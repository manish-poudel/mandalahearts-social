import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/models/async/async_state.dart';
import 'delete_account_state.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit({
    required this.appUserRepository,
    required this.authRepository,
    required this.postRepository,
  }) : super(const DeleteAccountState.init(isGoogleUser: false)) {
    _init();
  }

  final AppUserRepository appUserRepository;
  final AuthRepository authRepository;
  final PostRepository postRepository;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  static const genericErrorMessage =
      "If you have trouble deleting your account, please contact us at admin@mandalahearts.com or tap “Contact Us” in Settings, and we’ll be happy to help you complete the process.";

  AsyncState _appendGenericMessage(String? message) {
    if (message == null || message.isEmpty) {
      return AsyncState.error(genericErrorMessage);
    }
    return AsyncState.error('$message\n\n$genericErrorMessage');
  }

  /// ---------- INIT ----------
  Future<void> _init() async {
    final user = _auth.currentUser;
    if (user == null) {
      emit(
        DeleteAccountState.reauth(
          isGoogleUser: false,
          loginState: _appendGenericMessage('No user signed in.'),
        ),
      );
      return;
    }

    final isGoogleUser = user.providerData.any(
      (p) => p.providerId == 'google.com',
    );

    emit(
      DeleteAccountState.reauth(
        isGoogleUser: isGoogleUser,
        loginState: const AsyncState.initial(),
      ),
    );
  }

  /// ---------- REAUTH EMAIL ----------
  Future<void> reauthEmail(String password) async {
    final user = _auth.currentUser;
    if (user == null) return;

    emit(
      DeleteAccountState.reauth(
        isGoogleUser: false,
        loginState: const AsyncState.loading(),
      ),
    );

    try {
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);

      emit(
        DeleteAccountState.confirmDelete(
          isGoogleUser: false,
          deleteState: const AsyncState.initial(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      final msg = e.code == 'wrong-password' ? 'Incorrect password' : e.message;
      emit(
        DeleteAccountState.reauth(
          isGoogleUser: false,
          loginState: _appendGenericMessage(msg),
        ),
      );
    } catch (e) {
      emit(
        DeleteAccountState.reauth(
          isGoogleUser: false,
          loginState: _appendGenericMessage(e.toString()),
        ),
      );
    }
  }

  /// ---------- REAUTH GOOGLE ----------
  Future<void> reauthGoogle() async {
    emit(
      DeleteAccountState.reauth(
        isGoogleUser: true,
        loginState: const AsyncState.loading(),
      ),
    );

    try {
      final userCredential = await authRepository.reauthenticateWithGoogle();

      if (userCredential == null) {
        emit(
          DeleteAccountState.reauth(
            isGoogleUser: true,
            loginState: _appendGenericMessage('Failed to reauthenticate.'),
          ),
        );
        return;
      }

      emit(
        DeleteAccountState.confirmDelete(
          isGoogleUser: true,
          deleteState: const AsyncState.initial(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        DeleteAccountState.reauth(
          isGoogleUser: true,
          loginState: _appendGenericMessage(e.message),
        ),
      );
    } catch (e) {
      emit(
        DeleteAccountState.reauth(
          isGoogleUser: true,
          loginState: _appendGenericMessage(e.toString()),
        ),
      );
    }
  }

  /// ---------- DELETE ACCOUNT ----------
  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final isGoogleUser = state.when(
      init: (_) => false,
      reauth: (isGoogleUser, _) => isGoogleUser,
      confirmDelete: (isGoogleUser, _) => isGoogleUser,
    );

    emit(
      DeleteAccountState.confirmDelete(
        isGoogleUser: isGoogleUser,
        deleteState: const AsyncState.loading(),
      ),
    );

    try {
      // Delete all user posts in batch
      final postsDeleted = await postRepository.deletePostsByCreatorBatch(
        user.uid,
        limit: 500,
      );

      if (!postsDeleted) {
        emit(
          DeleteAccountState.confirmDelete(
            isGoogleUser: isGoogleUser,
            deleteState: _appendGenericMessage(
              'Something went wrong. Try again!',
            ),
          ),
        );
        return;
      }

      // Delete app-specific user data
      final appDeleted = await appUserRepository.deleteAccount();
      if (!appDeleted) {
        emit(
          DeleteAccountState.confirmDelete(
            isGoogleUser: isGoogleUser,
            deleteState: _appendGenericMessage(
              'Something went wrong. Try again!',
            ),
          ),
        );
        return;
      }

      // Delete Firebase auth user
      final authDeleted = await authRepository.deleteAccount();
      if (!authDeleted) {
        emit(
          DeleteAccountState.confirmDelete(
            isGoogleUser: isGoogleUser,
            deleteState: _appendGenericMessage(
              'Something went wrong. Try again!',
            ),
          ),
        );
        return;
      }

      emit(
        DeleteAccountState.confirmDelete(
          isGoogleUser: isGoogleUser,
          deleteState: const AsyncState.success(),
        ),
      );
    } catch (e) {
      emit(
        DeleteAccountState.confirmDelete(
          isGoogleUser: isGoogleUser,
          deleteState: _appendGenericMessage(e.toString()),
        ),
      );
    }
  }
}
