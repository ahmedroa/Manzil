import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/features/Reservations/logic/Reservations_cubit.dart';
import 'package:manzil/features/Reservations/logic/reservations_state.dart';
import 'package:manzil/features/Reservations/ui/widgets/current_reservations.dart';
import 'package:manzil/features/home/ui/widgets/nearby_your_location/nearby_your_location_shimmer.dart';

class CurrentReservationsBlocBuilder extends StatefulWidget {
  const CurrentReservationsBlocBuilder({super.key});

  @override
  _CurrentReservationsBlocBuilderState createState() => _CurrentReservationsBlocBuilderState();
}

class _CurrentReservationsBlocBuilderState extends State<CurrentReservationsBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ReservationsCubit, ReservationsState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (reservationsList) {
                return Column(
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: reservationsList.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return CurrentReservations(reservationList: reservationsList[index]);
                      },
                    ),
                  ],
                );
              },
              error: (message) {
                return Center(child: Text('Error: $message'));
              },
              loading: () {
                return const Center(child: Text('Error: '));
              },
              orElse: () {
                return const NearbyYourLocationShimmer();
              },
            );
          },
        ),
      ],
    );
  }
}
