// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzil/features/Reservations/data/model/currentr_reservations_model.dart';
import 'package:manzil/features/Reservations/data/model/past_reservations_model.dart';
import 'package:manzil/features/Reservations/logic/reservations_state.dart';

class ReservationsCubit extends Cubit<ReservationsState> {
  ReservationsCubit() : super(const ReservationsState.initial());
  int selectedOption = 0;

  List<PastReservationsModel> pastReservationsList = [];
  Future<void> fetcPastReservations() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('iYZqs9tr68jvrNZui4DV')
          .collection('past reservations')
          .get();
      pastReservationsList = querySnapshot.docs.map((doc) => PastReservationsModel.fromMap(doc.data())).toList();
      emit(ReservationsState.successPast(pastReservationsList));
      print('success fetching past reservations');
    } catch (e) {
      emit(ReservationsState.error(e.toString()));
      print('Error fetching units: $e');
    }
  }

  List<CurrentrReservationsModel> currentReservationsList = [];
  int currentReservationsCount = 0;

  Future<void> fetcCurrentReservations() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('iYZqs9tr68jvrNZui4DV')
          .collection('current reservations')
          .get();
      currentReservationsList = querySnapshot.docs.map((doc) => CurrentrReservationsModel.fromMap(doc.data())).toList();
      currentReservationsCount = currentReservationsList.length;
      emit(ReservationsState.success(currentReservationsList));
    } catch (e) {
      emit(ReservationsState.error(e.toString()));
      print('Error fetching units: $e');
    }
  }
}
