import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/icon.dart';

class ReservationBeds extends StatelessWidget {
  const ReservationBeds({super.key});

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorsManager.containerColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      IconsManger.top,
                      color: ColorsManager.kPrimaryColor,
                      height: 30,
                    ),
                  ),
                );
              }),
            ),
          ),
          verticalSpace(40),
          Text('Bottom bunk', style: TextStyles.fon16DarkMedium),
          verticalSpace(20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorsManager.containerColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      IconsManger.bottom,
                      color: ColorsManager.kPrimaryColor,
                      height: 30,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
