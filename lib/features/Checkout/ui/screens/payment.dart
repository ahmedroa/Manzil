import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/main_button.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/Checkout/ui/widget/VAT.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        leading: goBackWidget(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment type',
              style: TextStyles.fon16DarkMedium,
            ),
            verticalSpace(20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: .8,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RadioListTile<int>(
                value: 1,
                activeColor: ColorsManager.kPrimaryColor,
                groupValue: selectedOption,
                title: Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset(
                    IconsManger.mada,
                    width: 20,
                    height: 20,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            verticalSpace(20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: .8,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RadioListTile<int>(
                value: 2,
                activeColor: ColorsManager.kPrimaryColor,
                groupValue: selectedOption,
                title: Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset(
                    IconsManger.applepey,
                    width: 30,
                    height: 30,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            const Spacer(),
            MainButton(
                text: 'pay now 2250 ',
                onTap: () {
                  vatWidget(context);
                }),
            verticalSpace(30)
          ],
        ),
      ),
    );
  }
}
