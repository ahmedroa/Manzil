import 'package:freezed_annotation/freezed_annotation.dart';

part 'browse_state.freezed.dart';

@freezed
class BrowseState<T> with _$BrowseState<T> {
  const factory BrowseState.initial() = _Initial;

  const factory BrowseState.loading() = _Loading;

  const factory BrowseState.success(T data) = _Success<T>;

  const factory BrowseState.error(String message) = _Error;
}
