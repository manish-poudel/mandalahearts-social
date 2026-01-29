import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/models/async/async_state.dart';

part 'delete_account_state.freezed.dart';

@freezed
abstract class DeleteAccountState with _$DeleteAccountState {
  /// Initial state: we know if user is Google or email
  const factory DeleteAccountState.init({required bool isGoogleUser}) = _Init;

  /// Reauthentication state
  const factory DeleteAccountState.reauth({
    required bool isGoogleUser,
    @Default(AsyncState.initial()) AsyncState loginState,
  }) = _Reauth;

  /// Confirm deletion state
  const factory DeleteAccountState.confirmDelete({
    required bool isGoogleUser,
    @Default(AsyncState.initial()) AsyncState deleteState,
  }) = _ConfirmDelete;
}
