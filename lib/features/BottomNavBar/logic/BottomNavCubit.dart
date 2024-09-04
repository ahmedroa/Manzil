import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/features/Reservations/logic/Reservations_cubit.dart';
import 'package:manzil/features/Reservations/ui/screens/Reservations.dart';
import 'package:manzil/features/home/logic/cubit/home_cubit.dart';
import 'package:manzil/features/home/ui/screens/Browse/Browse.dart';
import 'package:manzil/features/home/ui/screens/home.dart';
import 'package:manzil/features/setting/ui/screens/Setting.dart';

// Bottom Navigation Bar Cubit
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
  static BottomNavCubit get(BuildContext context) => BlocProvider.of(context);

  static List screens = [
    BlocProvider(
      create: (context) => HomeCubit()..fetchUnits(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => HomeCubit()..fetchUnits(),
      child: const Browse(),
    ),
    BlocProvider(
      create: (context) => ReservationsCubit()
        ..fetcCurrentReservations()
        ..fetcPastReservations(),
      child: const Reservations(),
    ),
    const Setting(),
  ];
  changeSelectedIndex(newIndex) => emit(newIndex);
}
