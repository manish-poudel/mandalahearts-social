import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
abstract class AsyncState with _$AsyncState {
  const factory AsyncState.initial() = AsyncInitial;
  const factory AsyncState.loading() = AsyncLoading;
  const factory AsyncState.success() = AsyncSuccess;
  const factory AsyncState.error(String message) = AsyncError;
}
