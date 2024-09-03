import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/AppTextFormField.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/Checkout/logic/Checkout_cubit.dart';
import 'package:manzil/features/Checkout/ui/widget/apple_pay.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CheckoutCubit>(context);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: .3,
              )),
          child: RadioListTile<int>(
            value: 1,
            groupValue: cubit.selectedOption,
            activeColor: ColorsManager.kPrimaryColor,
            title: Row(
              children: [
                SvgPicture.asset(IconsManger.applepey),
              ],
            ),
            onChanged: (value) {
              setState(() {
                cubit.selectedOption = value!;
              });
            },
          ),
        ),
        verticalSpace(15),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: .3,
              )),
          child: RadioListTile<int>(
            value: 2,
            groupValue: cubit.selectedOption,
            activeColor: ColorsManager.kPrimaryColor,
            title: Row(
              children: [
                SvgPicture.asset(IconsManger.mada),
              ],
            ),
            onChanged: (value) {
              setState(() {
                cubit.selectedOption = value!;
              });
            },
          ),
        ),
        if (cubit.selectedOption == 2)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Text(
                'Fill your card details ',
                style: TextStyles.fon14DarkMedium,
              ),
              AppTextFormField(
                  hintText: 'xxxx-xxxx-xxxx-xxxx',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid card number';
                    }
                    return null;
                  }),
              verticalSpace(20),
              Row(
                children: [
                  Expanded(child: Text('Expiration', style: TextStyles.fon14DarkMedium)),
                  Expanded(child: Text('CVV', style: TextStyles.fon14DarkMedium)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                        hintText: '12/23',
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        }),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: AppTextFormField(
                        hintText: 'CVV',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid expiry date';
                          }
                          return null;
                        }),
                  ),
                ],
              )
            ],
          ),
        verticalSpace(40),
        if (cubit.selectedOption == 1)
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ApplePay(),
          ),
        if (cubit.selectedOption == 2)
          MainButton(
            text: 'proceed to payment',
            onTap: () {},
          ),
        verticalSpace(10),
        TextButton(
            onPressed: () {},
            child: Text(
              'Cancellation Policy',
              style: TextStyles.font14blueMedium,
            ))
      ],
    );
  }
}
