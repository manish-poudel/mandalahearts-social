import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/profile/cubits/profile_state.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit({
    required FirebaseAuth auth,
    required AppUserRepository userRepository,
  }) : _auth = auth,
       _userRepository = userRepository,
       super(const ProfileDetailsState.loading());

  final FirebaseAuth _auth;
  final AppUserRepository _userRepository;

  Future<void> load() async {
    try {
      final firebaseUser = _auth.currentUser;
      final appUser = _userRepository.currentUser;

      if (firebaseUser == null || appUser == null) {
        emit(const ProfileDetailsState.ready());
        return;
      }

      if (appUser.basicDetails != null) {
        emit(ProfileDetailsState.ready(user: appUser));
        return;
      }

      final displayName = firebaseUser.displayName?.trim();
      String firstName = '';
      String lastName = '';

      if (displayName != null && displayName.isNotEmpty) {
        final parts = displayName.split(RegExp(r'\s+'));

        firstName = parts.first;
        if (parts.length > 1) {
          lastName = parts.sublist(1).join(' ');
        }
      }

      final basicDetails = BasicDetails(
        firstName: firstName,
        secondName: lastName,
        dob: DateTime.now(),
        country: "Nepal",
      );

      final updatedUser = appUser.copyWith(basicDetails: basicDetails);

      emit(ProfileDetailsState.ready(user: updatedUser));
    } catch (e) {
      emit(
        ProfileDetailsState.error(message: 'Failed to load profile details'),
      );
    }
  }

  Future<void> save({
    required String firstName,
    required String lastName,
    required DateTime dob,
    required String countryName,
  }) async {
    AppUser? user = _userRepository.currentUser;
    try {
      emit(const ProfileDetailsState.saving());
      if (user != null) {
        user = user.copyWith(
          basicDetails: BasicDetails(
            firstName: firstName,
            secondName: lastName,
            dob: dob,
            country: countryName,
          ),
        );
      }
      await _userRepository.updateUser(user!);
      emit(ProfileDetailsState.success(user: user));
    } catch (e) {
      emit(
        ProfileDetailsState.error(
          message: 'Failed to save profile details',
          user: user,
        ),
      );
    }
  }
}
