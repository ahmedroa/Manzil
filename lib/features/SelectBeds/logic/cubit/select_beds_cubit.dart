// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:manzil/features/SelectBeds/model/select_beds.dart';

part 'select_beds_state.dart';

class SelectBedsCubit extends Cubit<SelectBedsState> {
  SelectBedsCubit() : super(SelectBedsInitialState());

  int totalselectedBed = 0;
  int totalprice = 0;
  SelectBedsModel? selectBedsModel;

  Future<void> getBeds(String id) async {
    // print(id);
    // emit(LoadingSelectBedsStateState());
    // try {
    //   var queryDocumentSnapshot = await FirebaseFirestore.instance
    //       .collection('unit')
    //       .doc('ryyJDjcvI0zoOWdCFbx6')
    //       .collection('allBeds')
    //       .doc('bedCondition')
    //       .get();
    //   if (queryDocumentSnapshot.exists) {
    //     var data = queryDocumentSnapshot.data();
    //     if (data != null) {
    //       SelectBedsModel.fromMap(data);

    //       print("Data from Firestore: $data");
    //       // SelectBedsModel bedModel =
    //       // print('object');
    //       // print("Data from Firestore: ${bedModel.topOne}");
    //       // print("Data from Firestore: ${bedModel.topSix}");
    //       // print("Data from Firestore: ${bedModel.bottomFour}");
    //       // print("Data from Firestore: ${bedModel.topFour}");
    //     }
    //   } else {
    //     print("Document does not exist!");
    //   }
    //   // emit(SuccessGetAllBedsState());
    // } catch (e) {
    //   emit(ErrorSelectBedsStateState(message: e.toString()));
    // }
  }

  Future<void> fetchUnits(String unitId) async {
    SelectBedsLoading();
    try {
      emit(SelectBedsLoading());

      final documentSnapshot = await FirebaseFirestore.instance
          .collection('unit')
          .doc('ryyJDjcvI0zoOWdCFbx6')
          .collection('topp')
          .doc('MaSB5oUNGHSx2aywAoEh')
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> bedStatusMap = documentSnapshot.data() ?? {};
        List<Map<String, bool>> bedStatusList = bedStatusMap.entries
            .map((entry) => {entry.key: entry.value as bool})
            .toList()
          ..sort((a, b) => int.parse(a.keys.first).compareTo(int.parse(b.keys.first)));
        emit(SelectBedsLoaded(bedStatusList));
      } else {
        emit(const SelectBedsError('No bed status found.'));
      }
    } catch (e) {
      emit(SelectBedsError('Failed to fetch data: $e'));
    }
  }

  Future<void> toggleBedStatus(String unitId, String bedNumber, bool isAvailable) async {
    try {
      final newStatus = !isAvailable; // تغيير حالة السرير
      await FirebaseFirestore.instance
          .collection('unit')
          .doc('ryyJDjcvI0zoOWdCFbx6')
          .collection('topp')
          .doc('MaSB5oUNGHSx2aywAoEh')
          .update({bedNumber: newStatus}); // تحديث الحالة في Firebase

      // بعد التحديث، نقوم بإعادة جلب البيانات لتحديث الواجهة
      fetchUnits(unitId);
    } catch (e) {
      emit(SelectBedsError('Failed to update bed status: $e'));
    }
  }

  // Future<void> fetchUnits(String unitId) async {
  //   try {
  //     emit(SelectBedsLoading());

  //     final documentSnapshot = await FirebaseFirestore.instance
  //         .collection('unit')
  //         .doc('ryyJDjcvI0zoOWdCFbx6')
  //         .collection('topp')
  //         .doc('MaSB5oUNGHSx2aywAoEh') // افترض أنك تستخدم مستند معين لبيانات الأسرة
  //         .get();

  //     if (documentSnapshot.exists) {
  //       // جلب البيانات كخريطة
  //       Map<String, dynamic> bedStatusMap = documentSnapshot.data() ?? {};

  //       // تحويل الخريطة إلى قائمة لعرضها لاحقًا
  //       List<Map<String, dynamic>> bedStatusList = bedStatusMap.entries.map((entry) {
  //         return {entry.key: entry.value};
  //       }).toList();

  //       emit(SelectBedsLoaded(bedStatusList));
  //     } else {
  //       emit(const SelectBedsError('No bed status found.'));
  //     }
  //   } catch (e) {
  //     emit(SelectBedsError('Failed to fetch data: $e'));
  //   }
  // }
}
