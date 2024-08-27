import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/features/Reservations/logic/Reservations_cubit.dart';
import 'package:manzil/features/Reservations/ui/widgets/current_reservations_bloc_builder.dart';
import 'package:manzil/features/Reservations/ui/widgets/past_reservations_bloc_builder.dart';

class SectionReservations extends StatefulWidget {
  const SectionReservations({super.key});

  @override
  _SectionReservationsState createState() => _SectionReservationsState();
}

class _SectionReservationsState extends State<SectionReservations> {
  @override
  void initState() {
    BlocProvider.of<ReservationsCubit>(context).fetcPastReservations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ReservationsCubit>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cubit.selectedOption = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: cubit.selectedOption == 0 ? ColorsManager.kPrimaryColor : const Color(0xffA2A2A2),
                          width: cubit.selectedOption == 0 ? 2 : 0.5,
                        ),
                      ),
                    ),
                    child: Text('Current Reservations',
                        style: cubit.selectedOption == 0
                            ? const TextStyle(
                                color: ColorsManager.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )
                            : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2))),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cubit.selectedOption = 1;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: cubit.selectedOption == 1 ? ColorsManager.kPrimaryColor : const Color(0xffA2A2A2),
                          width: cubit.selectedOption == 1 ? 2 : 0.5,
                        ),
                      ),
                    ),
                    child: Text('Past Reservations',
                        style: cubit.selectedOption == 1
                            ? const TextStyle(
                                color: ColorsManager.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )
                            : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2))),
                  ),
                ),
              ),
            ],
          ),
          cubit.selectedOption == 0
              ? const CurrentReservationsBlocBuilder()
              : cubit.selectedOption == 1
                  ? BlocProvider(
                      create: (context) => ReservationsCubit()..fetcPastReservations(),
                      child: const PastReservationsBlocBuilder(),
                    )
                  : Container()
        ],
      ),
    );
  }
}
