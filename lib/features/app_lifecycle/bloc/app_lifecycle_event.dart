import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_lifecycle_event.freezed.dart';

@freezed
class AppLifeCycleEvent with _$AppLifeCycleEvent {
  const factory AppLifeCycleEvent.started() = Started;
  const factory AppLifeCycleEvent.onAuthStateChange({User? user}) =
      _OnAuthStateChange;
}
