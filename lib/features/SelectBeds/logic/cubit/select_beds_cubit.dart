import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manzil/features/SelectBeds/ui/screens/select_beds.dart';

part 'select_beds_state.dart';

class SelectBedsCubit extends Cubit<SelectBedsState> {
  SelectBedsCubit() : super(SelectBedsInitialState());
}
