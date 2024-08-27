import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/features/home/logic/cubit/home_cubit.dart';
import 'package:manzil/features/home/logic/cubit/home_state.dart';
import 'package:manzil/features/home/ui/widgets/recommended/Recommended_shimmer.dart';
import 'package:manzil/features/home/ui/widgets/recommended/build_recommended.dart';

class RecommendedBlocBuilder extends StatelessWidget {
  const RecommendedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    bool showAll = false;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          return const RecommendedShimmer();
        } else if (state is SuccessRecommendedState) {
          final displayedUnits = showAll ? state.units : state.units.take(2).toList();
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: List.generate(displayedUnits.length, (index) {
                  return BuildRecommended(unitList: state.units[index]);
                }),
              ),
            ),
          );
        } else if (state is ErrorRecommendedState) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const RecommendedShimmer();

          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
