import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/main_button.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/core/widgets/icon.dart';

class DetailsReservations extends StatelessWidget {
  const DetailsReservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 12.h, right: 12.h),
            child: Column(
              children: [
                Row(
                  children: [
                    goBackWidget(context),
                    horizontalSpace(MediaQuery.of(context).size.width * 0.3),
                    Text(
                      'Details',
                      style: TextStyles.fon20DarkMedium,
                    ),
                  ],
                ),
                verticalSpace(40),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.20),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/testt.png'),
                        verticalSpace(20),
                        Text('Number of reservations', style: TextStyles.fon10GreyRegular),
                        Row(
                          children: [
                            Text('#1295043666 ', style: TextStyles.font12DarkMedium),
                            const Icon(
                              Icons.copy,
                              color: ColorsManager.kPrimaryColor,
                              size: 14,
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        SvgPicture.asset(IconsManger.city),
                        Text('Unit', style: TextStyles.fon12GreyRegular),
                        Text('ar rayyan', style: TextStyles.fon14DarkMedium),
                        verticalSpace(20),
                        SvgPicture.asset(IconsManger.afferent),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Check-in', style: TextStyles.fon10GreyRegular),
                                Text('Kitc1/1/2024hen', style: TextStyles.fon14DarkMedium),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Check-Date of reserviton', style: TextStyles.fon10GreyRegular),
                                Text('Jan 04. 2024', style: TextStyles.fon14DarkMedium),
                              ],
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        SvgPicture.asset(IconsManger.card),
                        Text('Payment type', style: TextStyles.fon10GreyRegular),
                        Text('Bank transfer ', style: TextStyles.fon14DarkMedium),
                        const Spacer(),
                        MainButton(text: 'Download contract', onTap: () {}),
                        verticalSpace(20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
