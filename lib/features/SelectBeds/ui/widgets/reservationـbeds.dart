import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';
import 'package:manzil/features/SelectBeds/ui/widgets/top_bunk.dart';

class ReservationBeds extends StatelessWidget {
  final String unitId;
  const ReservationBeds({super.key, required this.unitId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Please select the number of beds\n you want:', style: TextStyles.font20DarkReqular),
          verticalSpace(20),
          Text('Top bunk', style: TextStyles.fon16DarkMedium),
          verticalSpace(20),
          const TopBunkWidget(
            unitId: 'ryyJDjcvI0zoOWdCFbx6',
          ),
          verticalSpace(40),
          Text('Bottom bunk', style: TextStyles.fon16DarkMedium),
          verticalSpace(20),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: List.generate(5, (index) {
          //       return Container(
          //         margin: const EdgeInsets.symmetric(horizontal: 8),
          //         height: 40,
          //         width: 40,
          //         decoration: BoxDecoration(
          //           color: ColorsManager.containerColor,
          //           borderRadius: BorderRadius.circular(6),
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: SvgPicture.asset(
          //             IconsManger.bottom,
          //             color: ColorsManager.kPrimaryColor,
          //             height: 30,
          //           ),
          //         ),
          //       );
          //     }),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class UnitScreen extends StatelessWidget {
  const UnitScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unit Details')),
      body: BlocProvider(
        create: (context) => SelectBedsCubit()..fetchUnits('ryyJDjcvI0zoOWdCFbx6'),
        child: BlocBuilder<SelectBedsCubit, SelectBedsState>(
          builder: (context, state) {
            if (state is LoadingSelectBedsStateState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessGetAllBedsState) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(state.bedStatus.length, (index) {
                    final bedStatus = state.bedStatus[index];
                    Color containerColor =
                        bedStatus['status'] == 'available' ? ColorsManager.containerBlue : Colors.blue;
                    return Container(
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
                          color: ColorsManager.kPrimaryColor,
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  }),
                ),
              );
            } else if (state is ErrorSelectBedsStateState) {
              return Center(child: Text(state.message));
            }
            return Container(); // حالة افتراضية
          },
        ),
      ),
    );
  }
}

// مكون BedStatusContainer لتغيير لون الـ Container بناءً على حالة الحجز
class BedStatusContainer extends StatelessWidget {
  final String status; // حالة السرير، "available" أو "not available"

  const BedStatusContainer({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    // تحديد اللون بناءً على الحالة
    Color containerColor = status == 'available' ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: containerColor, // اللون يتغير بناءً على الحالة
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          IconsManger.top, // أيقونة من IconsManager
          color: ColorsManager.kPrimaryColor, // اللون الخاص بالأيقونة
          height: 30,
        ),
      ),
    );
  }
}
