import 'package:flutter/material.dart';
import 'package:manzil/core/theme/colors.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.kPrimaryColor),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    elevation: 0,
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarColor: ColorsManager.,
    //   statusBarIconBrightness: Brightness.dark,
    // ),
  ),
);
