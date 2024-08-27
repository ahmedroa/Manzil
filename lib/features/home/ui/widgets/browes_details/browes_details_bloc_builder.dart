import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/features/home/logic/cubit/home_cubit.dart';
import 'package:manzil/features/home/logic/cubit/home_state.dart';
import 'package:manzil/features/home/ui/widgets/browes_details/build_unit.dart';
import 'package:manzil/features/home/ui/widgets/recommended/Recommended_shimmer.dart';

class BrowesDetailsBlocBuilder extends StatelessWidget {
  const BrowesDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          return const RecommendedShimmer();
        } else if (state is SuccessRecommendedState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => verticalSpace(15),
            itemCount: state.units.length,
            itemBuilder: (context, index) {
              final unit = state.units[index];
              return BuildUnit(unitList: unit);
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
