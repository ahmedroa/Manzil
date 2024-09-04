// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/extensions.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/routing/app_router.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/core/widgets/icon.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          selectRoom(),
          const Spacer(),
          housingStatus(),
          const Divider(),
          verticalSpace(20),
          totalPrice(),
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: MainButton(
                text: 'Reseve',
                onTap: () {
                  context.pushNamed(Routes.checkout);
                }),
          ),
          verticalSpace(40),
        ],
      ),
    );
  }

  Padding selectRoom() {
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
  // const TopBottomWidget(),

  Padding totalPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
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
      ),
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
