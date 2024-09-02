// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/extensions.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/routing/app_router.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/features/SelectBeds/ui/widgets/Section%D9%80select_beds.dart';
import 'package:manzil/features/SelectBeds/ui/widgets/top_bottom_widget.dart';

class SelectBeds extends StatefulWidget {
  const SelectBeds({super.key});

  @override
  State<SelectBeds> createState() => _SelectBedsState();
}

class _SelectBedsState extends State<SelectBeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Beds'),
        leading: goBackWidget(context),
      ),
      body: Column(
        children: [
          verticalSpace(20),
          const SelectRoom(),
          verticalSpace(30),
          const TopBottomWidget(),
          verticalSpace(70),
          const Spacer(),
          housingStatus(),
          const Divider(),
          verticalSpace(20),
          totalPrice(),
          verticalSpace(20),
          MainButton(
              text: 'Reseve',
              onTap: () {
                context.pushNamed(Routes.checkout);
              }),
          verticalSpace(40),
        ],
      ),
    );
  }

  Row totalPrice() {
    return Row(
      children: [
        Text(
          'Total selected bed: 2',
          style: TextStyles.fon15DarkMedium,
        ),
        const Spacer(),
        Text(
          '1750 SAR',
          style: TextStyles.fon15DarkMedium,
        ),
      ],
    );
  }

  housingStatus() => Row(
        children: [
          horizontalSpace(20),
          Expanded(
              child: Row(
            children: [
              Container(
                color: const Color(0xffEFF3FB),
                width: 15,
                height: 15,
              ),
              horizontalSpace(10),
              Text(
                'Available',
                style: TextStyles.fon12DarkMedium,
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Container(
                color: ColorsManager.kPrimaryColor,
                width: 15,
                height: 15,
              ),
              horizontalSpace(10),
              Text(
                'Selected',
                style: TextStyles.fon12DarkMedium,
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Container(
                color: ColorsManager.icontGrey,
                width: 15,
                height: 15,
              ),
              horizontalSpace(10),
              Text(
                'Reserved',
                style: TextStyles.fon12DarkMedium,
              ),
            ],
          )),
        ],
      );
}
