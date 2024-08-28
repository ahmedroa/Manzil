// ignore_for_file: void_checks

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<UnitModle> units = [];

  HomeCubit() : super(HomeInitialState());

  Future<void> fetchUnits() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('unit').get();
      units = querySnapshot.docs.map((doc) => UnitModle.fromMap(doc.data())).toList();
      emit(SuccessRecommendedState(units));
    } catch (e) {
      emit(ErrorRecommendedState(message: e.toString()));
    }
  }
}
