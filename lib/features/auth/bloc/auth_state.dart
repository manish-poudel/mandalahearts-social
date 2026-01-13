import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/app/app_routes.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated({required AppRoute navigateTo}) =
      _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
