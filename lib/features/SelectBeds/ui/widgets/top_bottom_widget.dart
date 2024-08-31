import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/icon.dart';

class TopBottomWidget extends StatelessWidget {
  const TopBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.containerColor,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconsManger.bottom,
                      height: 30,
                    ),
                    horizontalSpace(10),
                    Text(
                      'Bottom',
                      style: TextStyles.fon12DarkRegular,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconsManger.top,
                      height: 30,
                    ),
                    horizontalSpace(10),
                    Text(
                      'Top',
                      style: TextStyles.fon12DarkRegular,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
