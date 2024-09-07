import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/features/Reservations/data/model/currentr_reservations_model.dart';
import 'package:manzil/features/Reservations/logic/Reservations_cubit.dart';
import 'package:manzil/features/Reservations/ui/screens/details.dart';

class CurrentReservations extends StatelessWidget {
  final CurrentrReservationsModel reservationList;
  const CurrentReservations({super.key, required this.reservationList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(20),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Number Of Reservations: ',
              style: TextStyles.fon14DarkMedium,
            ),
            TextSpan(
              text: BlocProvider.of<ReservationsCubit>(context).currentReservationsCount.toString(),
              style: TextStyles.font14blueMedium,
            )
          ]),
        ),
        verticalSpace(20),
        GestureDetector(
          onTap: () {
            navigateTo(context, const DetailsReservations());
          },
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              color: ColorsManager.containerColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.20),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/homel.png'),
                  horizontalSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Number of reservations', style: TextStyles.fon10GreyRegular),
                      Text('${reservationList.numberOfReservations}', style: TextStyles.font12DarkMedium),
                      Text('Unit', style: TextStyles.fon12GreyRegular),
                      Text(reservationList.unit, style: TextStyles.fon14DarkMedium),
                      Text('Number Of Beds', style: TextStyles.fon12GreyRegular),
                      Text('${reservationList.numberOfBeds}', style: TextStyles.fon14DarkMedium),
                      verticalSpace(4),
                      Text('Check-in', style: TextStyles.fon10GreyRegular),
                      Text(reservationList.checkIn, style: TextStyles.fon14DarkMedium),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xff0EC64C).withOpacity(0.25),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Paid',
                              style: TextStyles.fon10GreyRegular.copyWith(color: const Color(0xff0EC64C)),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text('Check-out', style: TextStyles.fon10GreyRegular),
                      Text(reservationList.checkOut, style: TextStyles.fon14DarkMedium),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
