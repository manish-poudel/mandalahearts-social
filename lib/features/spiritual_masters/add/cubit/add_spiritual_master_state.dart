import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/models/async/async_state.dart';
// your AsyncState definition

part 'add_spiritual_master_state.freezed.dart';

@freezed
class AddSpiritualMasterState with _$AddSpiritualMasterState {
  /// Fetching masters
  const factory AddSpiritualMasterState.loading() = _Loading;

  const factory AddSpiritualMasterState.loaded({
    required List<SpiritualMaster> spiritualMasters,
    SpiritualMaster? selectedMaster,
    @Default(false) allowCustomMaster,
    @Default(AsyncState.initial()) AsyncState saveState,
  }) = _Loaded;

  const factory AddSpiritualMasterState.error({required String message}) =
      _Error;
}
