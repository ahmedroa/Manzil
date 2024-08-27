import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/goBack.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: goBackWidget(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: ColorsManager.circleColor,
                  borderRadius: BorderRadius.circular(120),
                ),
                child: const Icon(
                  Icons.check,
                  size: 100,
                  color: ColorsManager.kPrimaryColor,
                ),
              ),
              verticalSpace(40),
              Text(
                'Payment Successful',
                style: TextStyles.fon20DarkMedium,
              ),
              verticalSpace(20),
              Text(
                'Congrats! you will receive the contract via message',
                style: TextStyles.fon15GreyRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(60),
              Text(
                'Number of reservations',
                style: TextStyles.fon15GreyRegular,
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '#1295043666 ',
                    style: TextStyles.fon20DarkMedium,
                  ),
                  const Icon(
                    Icons.copy,
                    color: ColorsManager.kPrimaryColor,
                    size: 14,
                  ),
                ],
              ),
              verticalSpace(40),
              MainButton(text: 'Done', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
