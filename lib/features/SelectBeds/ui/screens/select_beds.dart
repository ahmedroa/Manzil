// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/helpers/extensions.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/routing/app_router.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/main_button.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';
import 'package:manzil/features/SelectBeds/ui/widgets/reservation%D9%80beds.dart';

class SelectBeds extends StatefulWidget {
  final price;
  const SelectBeds({super.key, required this.price});

  @override
  State<SelectBeds> createState() => _SelectBedsState();
}

class _SelectBedsState extends State<SelectBeds> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SelectBedsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Beds'),
        leading: goBackWidget(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          const ReservationBeds(),
          const Spacer(),
          housingStatus(),
          const Divider(),
          verticalSpace(20),
          totalPrice(cubit),
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

  Padding totalPrice(cubit) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Text(
            'Total selected bed:  ${cubit.totalselectedBed}',
            style: TextStyles.fon15DarkMedium,
          ),
          const Spacer(),
          Text(
            '${cubit.totalprice} SAR',
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
                style: TextStyles.font12DarkMedium,
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Container(
                color: ColorsManager.kPrimaryColor,
                width: 15.w,
                height: 15.h,
              ),
              horizontalSpace(10),
              Text(
                'Selected',
                style: TextStyles.font12DarkMedium,
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Container(
                color: ColorsManager.icontGrey,
                width: 15.w,
                height: 15.h,
              ),
              horizontalSpace(10),
              Text(
                'Reserved',
                style: TextStyles.font12DarkMedium,
              ),
            ],
          )),
        ],
      );
}
