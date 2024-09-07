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
