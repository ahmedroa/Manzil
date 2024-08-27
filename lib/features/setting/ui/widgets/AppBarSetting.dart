import 'package:flutter/material.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/icon.dart';

class AppBarSetting extends StatelessWidget {
  const AppBarSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: ColorsManager.kPrimaryColor,
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(IconsManger.logoWhite),
        )
      ],
    );
  }
}
