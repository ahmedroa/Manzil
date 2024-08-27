import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/features/home/logic/cubit/home_cubit.dart';
import 'package:manzil/features/home/logic/cubit/home_state.dart';
import 'package:manzil/features/home/ui/widgets/nearby_your_location/nearby_your_location.dart';
import 'package:manzil/features/home/ui/widgets/nearby_your_location/nearby_your_location_shimmer.dart';

class NearbyYourLocationBlocBuilder extends StatefulWidget {
  const NearbyYourLocationBlocBuilder({super.key});

  @override
  _NearbyYourLocationBlocBuilderState createState() => _NearbyYourLocationBlocBuilderState();
}

class _NearbyYourLocationBlocBuilderState extends State<NearbyYourLocationBlocBuilder> {
  bool showAll = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          return const NearbyYourLocationShimmer();
        } else if (state is SuccessRecommendedState) {
          final displayedUnits = showAll ? state.units : state.units.take(2).toList();
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => verticalSpace(15),
            itemCount: displayedUnits.length,
            itemBuilder: (context, index) {
              final unit = state.units[index];
              return NearbyYourLocation(
                unitList: unit,
              );
            },
          );
        } else if (state is ErrorRecommendedState) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}



  // return Column(
    //   children: [
    //     BlocBuilder<HomeCubit, HomeState>(
    //       builder: (context, state) {
    //         return state.maybeWhen(
    //           success: (units) {
    //             final displayedUnits = showAll ? units : units.take(2).toList();
    //             return const NearbyYourLocationShimmer();

    //             return Column(
    //               children: [
    //                 ListView.separated(
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemCount: displayedUnits.length,
    //                   separatorBuilder: (context, index) => const SizedBox(height: 10),
    //                   itemBuilder: (context, index) {
    //                     return NearbyYourLocation(
    //                       unitList: displayedUnits[index],
    //                     );
    //                   },
    //                 ),
    //               ],
    //             );
    //           },
    //           error: (message) {
    //             return Center(child: Text('Error: $message'));
    //           },
    //           loading: () {
    //             return const NearbyYourLocationShimmer();

    //           },
    //           orElse: () {
    //             return const NearbyYourLocationShimmer();
    //           },
    //         );
    //       },
    //     ),
    //   ],
    // );