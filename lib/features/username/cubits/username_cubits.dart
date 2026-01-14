import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/exceptions/database_exceptions.dart';
import 'package:mandalahearts/core/services/database/username_db.dart';
import 'package:mandalahearts/features/username/cubits/username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  final UsernameDB _usernameDB;

  UsernameCubit({required UsernameDB usernameDB})
    : _usernameDB = usernameDB,
      super(const UsernameState.initial());

  Future<void> saveUsername(String username) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        emit(const UsernameState.error(message: 'User not authenticated'));
        return;
      }
      if (username.isEmpty) {
        emit(const UsernameState.error(message: 'Username cannot be empty'));
        return;
      }
      emit(const UsernameState.loading());
      await _usernameDB.createUsername(username: username, userId: userId);
      emit(const UsernameState.success());
    } catch (e) {
      if (e is UsernameAlreadyExistsException) {
        emit(const UsernameState.error(message: 'Username already exists'));
        return;
      }
      emit(UsernameState.error(message: "Something went wrong"));
    }
  }
}
