// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:manzil/features/Checkout/logic/Checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  int selectedOption = 1;

  void updateSelectedOption(int value) {}

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  void checkPlatform() {
    if (Platform.isAndroid) {
      print("The app is running on Android");
    } else if (Platform.isIOS) {
      print("The app is running on iOS");
    } else {
      print("The app is running on an unknown platform");
    }
  }
}
