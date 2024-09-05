// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzil/features/SelectBeds/model/select_beds.dart';

part 'select_beds_state.dart';

class SelectBedsCubit extends Cubit<SelectBedsState> {
  SelectBedsCubit() : super(SelectBedsInitialState());

  int totalselectedBed = 0;
  int totalprice = 0;

  // void totalAmount() {
  //   totalprice = totalselectedBed * 100;
  // }

  Future<void> getBeds(String id) async {
    print(id);
    emit(LoadingSelectBedsStateState());
    try {
      var queryDocumentSnapshot = await FirebaseFirestore.instance
          .collection('unit')
          .doc('ryyJDjcvI0zoOWdCFbx6')
          .collection('allBeds')
          .doc('bedCondition')
          .get();
      if (queryDocumentSnapshot.exists) {
        var data = queryDocumentSnapshot.data();
        if (data != null) {
          print("Data from Firestore: $data");
          SelectBedsModel bedModel = SelectBedsModel.fromMap(data);

          print('object');
          print("Data from Firestore: ${bedModel.topOne}");
          print("Data from Firestore: ${bedModel.topSix}");
          print("Data from Firestore: ${bedModel.bottomFour}");
          print("Data from Firestore: ${bedModel.topFour}");
        }
      } else {
        print("Document does not exist!");
      }
      emit(SuccessGetAllBedsState());
    } catch (e) {
      emit(ErrorSelectBedsStateState(message: e.toString()));
    }
  }
}
