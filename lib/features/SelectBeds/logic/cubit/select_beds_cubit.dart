import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzil/features/SelectBeds/model/select_beds.dart';

part 'select_beds_state.dart';

class SelectBedsCubit extends Cubit<SelectBedsState> {
  List<SelectBedsModel> selectBeds = [];

  SelectBedsCubit() : super(SelectBedsInitialState());

  int totalselectedBed = 0;
  int totalprice = 0;

  Future<void> getBeds(String id) async {
    print(id);
    emit(LoadingSelectBedsStateState());
    try {
      await FirebaseFirestore.instance.collection('unit').doc(id).collection('top').doc('M6bPrEy1E5ZzlHDbjrX9').get();

      emit(SuccessState());
    } catch (e) {
      emit(ErrorSelectBedsStateState(message: e.toString()));
    }
  }
}
