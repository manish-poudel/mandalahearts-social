import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/models/async/async_state.dart';
import 'package:mandalahearts/repository/app_config_repository.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/spiritual_master_repository.dart';
import 'add_spiritual_master_state.dart';

class AddSpiritualMasterCubit extends Cubit<AddSpiritualMasterState> {
  final SpiritualMasterRepository repository;
  final AppUserRepository appUserRepository;
  final AppConfigRepository appConfigRepository;
  AddSpiritualMasterCubit({
    required this.repository,
    required this.appUserRepository,
    required this.appConfigRepository,
  }) : super(const AddSpiritualMasterState.loading());

  Future<void> loadMasters() async {
    emit(const AddSpiritualMasterState.loading());
    try {
      final masters = await repository.getSpiritualMasters();
      masters.sort((a, b) => a.name.compareTo(b.name));
      emit(AddSpiritualMasterState.loaded(spiritualMasters: masters));
    } catch (e) {
      emit(AddSpiritualMasterState.error(message: e.toString()));
    }
  }

  void toggleAllowCustomMaster() {
    state.maybeMap(
      loaded: (current) {
        emit(current.copyWith(allowCustomMaster: !current.allowCustomMaster));
      },
      orElse: () => null,
    );
  }

  void selectMaster(SpiritualMaster? master) {
    state.maybeMap(
      loaded: (current) {
        emit(current.copyWith(selectedMaster: master));
      },
      orElse: () => null,
    );
  }

  Future<void> saveMaster({String? customMaster}) async {
    state.maybeMap(
      loaded: (current) async {
        emit(current.copyWith(saveState: const AsyncState.loading()));
        try {
          SpiritualMaster spiritualMaster;
          if (current.allowCustomMaster) {
            spiritualMaster = SpiritualMaster(name: customMaster!);
          } else {
            if (current.selectedMaster == null) {
              emit(
                current.copyWith(
                  saveState: AsyncState.error('Please select master'),
                ),
              );
              return;
            }
            spiritualMaster = current.selectedMaster!;
          }

          AppUser appUser = appUserRepository.currentUser!;

          // Make a modifiable copy of the list
          List<SpiritualMaster> spiritualMasters = List<SpiritualMaster>.from(
            appUser.spiritualMasters ?? [],
          );

          final appConfig = await appConfigRepository.getAppConfig();
          final limit = appConfig.versions?.basics?.createSpiritualMasters;
          if (limit != null) {
            if (spiritualMasters.length >= limit) {
              emit(
                current.copyWith(
                  saveState: AsyncState.error(
                    'You have reached the limit of $limit spiritual masters.',
                  ),
                ),
              );
              return;
            }
          }
          // Check if already added
          if (spiritualMasters.any(
            (s) => s.name.toLowerCase() == spiritualMaster.name.toLowerCase(),
          )) {
            emit(
              current.copyWith(
                saveState: AsyncState.error('You already added this master'),
              ),
            );
            return;
          }

          spiritualMasters.add(spiritualMaster);

          await appUserRepository.updateUser(
            appUser.copyWith(spiritualMasters: spiritualMasters),
          );
          emit(current.copyWith(saveState: const AsyncState.success()));
        } catch (e) {
          emit(
            current.copyWith(
              saveState: AsyncState.error("Something went wrong"),
            ),
          );
        }
      },
      orElse: () => null,
    );
  }
}
