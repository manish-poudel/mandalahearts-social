// edit_profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/profile/edit_profile/cubits/edit_profile_state.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final AppUserRepository userRepository;

  EditProfileCubit({required this.userRepository})
    : super(const EditProfileState.loading());

  void load() {
    final user = userRepository.currentUser;

    if (user == null) {
      emit(const EditProfileState.error(message: 'Something went wrong!'));
      return;
    }

    emit(EditProfileState.loaded(user: user));
  }

  Future<void> saveBasicDetails({
    required String firstName,
    required String lastName,
    required DateTime dob,
    required String country,
  }) async {
    final user = state.maybeWhen(loaded: (user, _) => user, orElse: () => null);
    if (user == null) return;

    final current = user.basicDetails;

    if (current != null &&
        current.firstName == firstName &&
        current.secondName == lastName &&
        current.dob == dob &&
        current.country == country) {
      return;
    }
    emit(EditProfileState.loaded(user: user, isSaving: true));

    try {
      final updatedUser = user.copyWith(
        basicDetails: user.basicDetails?.copyWith(
          firstName: firstName,
          secondName: lastName,
          dob: dob,
          country: country,
        ),
      );
      await userRepository.updateUser(updatedUser);
      emit(EditProfileState.loaded(user: updatedUser));
    } catch (_) {
      emit(const EditProfileState.error(message: 'Failed to update profile'));
    }
  }
}
