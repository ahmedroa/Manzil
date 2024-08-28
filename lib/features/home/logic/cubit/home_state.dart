// part of 'home_cubit.dart';

import 'package:manzil/features/home/data/model/unit.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class SuccessRecommendedState extends HomeState {
  final List<UnitModle> units;

  SuccessRecommendedState(this.units);
}

class LoadingRecommendedState extends HomeState {}

class ErrorRecommendedState extends HomeState {
  final String message;

  ErrorRecommendedState({required this.message});
}




// @freezed
// class HomeState<T> with _$HomeState<T> {
//   const factory HomeState.initial(int index) = _Initial;

//   const factory HomeState.index(int index) = _Index;

//   const factory HomeState.loading() = _Loading;

//   const factory HomeState.success(T data) = _Success<T>;

//   const factory HomeState.error(String message) = _Error;
// }

