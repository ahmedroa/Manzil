import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzil/features/SelectBeds/model/select_beds.dart';

part 'select_beds_state.dart';

class SelectBedsCubit extends Cubit<SelectBedsState> {
  List<SelectBedsModel> selectBeds = [];

  SelectBedsCubit() : super(SelectBedsInitialState());
  bool containerColor = false;

  int selectedOption = 0;
  String selectedRoom = 'room 1';
  String selectedBeds = 'bottom';

  void selectRoom(String room) {
    selectedRoom = room;
    emit(SelectRoomState(room: room));
  }

  void selectBed(String beds) {
    selectedBeds = beds;
    emit(SelectBedState(beds: beds));
  }

  Future<void> getBeds(String id) async {
    emit(LoadingSelectBedsStateState());
    try {
      await FirebaseFirestore.instance.collection('unit').doc(id).collection(selectedRoom).doc('bad').get();

      emit(SuccessState());
    } catch (e) {
      emit(ErrorSelectBedsStateState(message: e.toString()));
    }
  }
}
