part of 'select_beds_cubit.dart';

// abstract class SelectBedsState {}

class SelectBedsInitialState extends SelectBedsState {}

class SuccessGetAllBedsState extends SelectBedsState {
  final Map<String, dynamic> bedStatus;

  const SuccessGetAllBedsState(this.bedStatus);
}

class LoadingSelectBedsStateState extends SelectBedsState {}

class ErrorSelectBedsStateState extends SelectBedsState {
  final String message;

  const ErrorSelectBedsStateState({required this.message});
}

abstract class SelectBedsState extends Equatable {
  const SelectBedsState();

  @override
  List<Object> get props => [];
}

class SelectBedsInitial extends SelectBedsState {}

class SelectBedsLoading extends SelectBedsState {}

class SelectBedsLoaded extends SelectBedsState {
  final List<Map<String, dynamic>> bedStatusList;

  const SelectBedsLoaded(this.bedStatusList);

  @override
  List<Object> get props => [bedStatusList];
}

class SelectBedsError extends SelectBedsState {
  final String message;

  const SelectBedsError(this.message);

  @override
  List<Object> get props => [message];
}
