// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/main_button.dart';
import 'package:manzil/features/Checkout/ui/screens/test_payment.dart';

void vatWidget(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      surfaceTintColor: Colors.white,
      content: const Text(
        'Buying as a company? Get You VAT Back!',
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
              text: 'Yes',
              onTap: () {
                navigateTo(context, const VATPage());
              },
              width: 120,
            ),
            horizontalSpace(40),
            Text(
              'Cancel',
              style: TextStyles.fon15GreyRegular,
            ),
          ],
        )
      ],
    ),
  );
}
