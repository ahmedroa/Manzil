import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzil/features/Browse%20/logic/cubit/browse_state.dart';
import 'package:manzil/features/home/data/model/unit.dart';

// part 'browse_cubit.freezed.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(const BrowseState.initial());

  List<UnitModle> units = [];

  Future<void> fetchUnits() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('unit').get();
      units = querySnapshot.docs.map((doc) => UnitModle.fromMap(doc.data())).toList();
      emit(BrowseState.success(units));
    } catch (e) {
      emit(BrowseState.error(e.toString()));
      print('Error fetching units: $e');
    }
  }
}
