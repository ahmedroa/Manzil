import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservations_state.freezed.dart';

@freezed
class ReservationsState<T> with _$ReservationsState<T> {
  const factory ReservationsState.initial() = _Initial;

  const factory ReservationsState.loading() = _Loading;

  const factory ReservationsState.success(T data) = _Success<T>;
  const factory ReservationsState.successPast(T data) = _Success2<T>;

  const factory ReservationsState.error(String message) = _Error;
}
