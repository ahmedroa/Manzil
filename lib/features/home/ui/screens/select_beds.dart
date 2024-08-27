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
  bool containerColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Beds'),
        leading: goBackWidget(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            verticalSpace(20),
            Container(
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
            ),
            verticalSpace(90),
            Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 0.3,
                color: Colors.grey,
              )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              containerColor = !containerColor;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: containerColor ? ColorsManager.kPrimaryColor : ColorsManager.containerBlue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                IconsManger.bottom,
                                color: containerColor ? Colors.white : ColorsManager.kPrimaryColor,
                                height: 30,
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(40),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: ColorsManager.kPrimaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              IconsManger.bottom,
                              color: Colors.white,
                              height: 30,
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                      ],
                    ),
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: ColorsManager.containerBlue,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  IconsManger.bottom,
                                  height: 30,
                                ),
                              ),
                            ),
                            verticalSpace(30),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: ColorsManager.containerBlue,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  IconsManger.bottom,
                                  height: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: ColorsManager.kPrimaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              IconsManger.bottom,
                              color: Colors.white,
                              height: 30,
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                      ],
                    ),
                    verticalSpace(20),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorsManager.kPrimaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          IconsManger.bottom,
                          color: Colors.white,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
