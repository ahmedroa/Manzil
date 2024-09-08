// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';

class TopBunkWidget extends StatelessWidget {
  final String unitId;
  const TopBunkWidget({super.key, required this.unitId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectBedsCubit, SelectBedsState>(
      builder: (context, state) {
        if (state is SelectBedsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SelectBedsLoaded) {
          return Row(
            children: List.generate(state.bedStatusList.length, (index) {
              // final bedStatus = state.bedStatusList[index];
              final isAvailable = state.bedStatusList[index].values.first;
              Color containerColor = isAvailable ? ColorsManager.containerBlue : ColorsManager.lightGray;
              Color iconColor = isAvailable ? ColorsManager.kPrimaryColor : Colors.white;
              return GestureDetector(
                onTap: () {
                  context.read<SelectBedsCubit>().toggleBedStatus('unitId', 'bedNumber', isAvailable);
                  // context.read<SelectBedsCubit>().toggleBedStatus(unitId, bedNumber, isAvailable);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      IconsManger.top,
                      color: iconColor,
                      height: 30,
                      width: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            }),
          );
        } else if (state is SelectBedsError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
