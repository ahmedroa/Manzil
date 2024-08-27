import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/AppTextFormField.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/features/Checkout/ui/screens/payment_successful.dart';

class VATPage extends StatelessWidget {
  const VATPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('VAT'),
          leading: goBackWidget(context),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Text('Vat Number', style: TextStyles.fon14DarkMedium),
              verticalSpace(10),
              AppTextFormField(
                hintText: '11350833',
                validator: (p0) {},
              ),
              verticalSpace(4),
              Text('You will have your vat back', style: TextStyles.font14GreyRegular),
              verticalSpace(20),
              Text('Name company', style: TextStyles.fon14DarkMedium),
              verticalSpace(10),
              AppTextFormField(
                hintText: 'ex compant',
                validator: (p0) {},
              ),
              verticalSpace(60),
              MainButton(
                text: 'Continue',
                onTap: () {
                  navigateTo(context, const PaymentSuccessful());
                },
              ),
            ],
          ),
        ));
  }
}
