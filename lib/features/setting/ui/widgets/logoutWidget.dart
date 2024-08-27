// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';

void logoutWidget(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      surfaceTintColor: Colors.white,
      content: const Text(
        'Are you sure you want to log out from your account?',
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffC6190E).withOpacity(0.17),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Yes log out',
                  style: TextStyles.font14RedMedium,
                ),
              ),
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
