import 'package:flutter/cupertino.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {}

final class CheckoutFailure extends CheckoutState {
  final String error;

  CheckoutFailure(this.error);
}