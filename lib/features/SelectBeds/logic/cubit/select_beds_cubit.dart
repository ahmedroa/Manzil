import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzil/features/SelectBeds/model/select_beds.dart';

part 'select_beds_state.dart';

class SelectBedsCubit extends Cubit<SelectBedsState> {
  List<SelectBedsModel> selectBeds = [];

  SelectBedsCubit() : super(SelectBedsInitialState());
  int selectedOption = 0;

  test() {
    print('object');
  }

  Future<void> getBeds(
    String id,
  ) async {
    emit(LoadingSelectBedsStateState());
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('unit').doc(id).collection('rom 1').get();
      selectBeds = querySnapshot.docs.map((doc) => SelectBedsModel.fromMap(doc.data())).toList();

      emit(SuccessState());
    } catch (e) {
      emit(ErrorSelectBedsStateState(message: e.toString()));
    }
  }
}
