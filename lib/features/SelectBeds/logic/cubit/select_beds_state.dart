part of 'select_beds_cubit.dart';

abstract class SelectBedsState {}

class SelectBedsInitialState extends SelectBedsState {}

class SuccessState extends SelectBedsState {
  // final List<SelectBeds> beds;

  // SuccessState(this.beds);
}

class LoadingSelectBedsStateState extends SelectBedsState {}

class ErrorSelectBedsStateState extends SelectBedsState {
  final String message;

  ErrorSelectBedsStateState({required this.message});
}

class SelectRoomState extends SelectBedsState {
  final String room;

  SelectRoomState({required this.room});
}

class SelectBedState extends SelectBedsState {
  final String beds;

  SelectBedState({required this.beds});
}
