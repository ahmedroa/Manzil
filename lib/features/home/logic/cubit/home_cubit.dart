// ignore_for_file: void_checks

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzil/features/home/ui/screens/Browse/Browse.dart';
import 'package:manzil/features/Reservations/logic/Reservations_cubit.dart';
import 'package:manzil/features/Reservations/ui/screens/Reservations.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/logic/cubit/home_state.dart';
import 'package:manzil/features/home/ui/screens/home.dart';
import 'package:manzil/features/setting/ui/screens/Setting.dart';

class HomeCubit extends Cubit<HomeState> {
  List<UnitModle> units = [];

  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void chengeBottomNavBar(int index) {
    print("Changing index to: $index");

    currentIndex = index;
    emit(NewBottonNavlState());
  }

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
  HomeState currentHomeState = HomeInitialState();

  Future<void> fetchUnits() async {
    if (currentHomeState is SuccessRecommendedState) {
      emit(currentHomeState);
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('unit').get();
      units = querySnapshot.docs.map((doc) => UnitModle.fromMap(doc.data())).toList();
      emit(SuccessRecommendedState(units));
    } catch (e) {
      emit(ErrorRecommendedState(message: e.toString()));
      print('Error fetching units: $e');
    }
  }
}
