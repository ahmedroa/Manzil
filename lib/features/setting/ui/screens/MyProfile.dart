import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/app_text_form_field.dart';
import 'package:manzil/core/widgets/goBack.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        leading: goBackWidget(context),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              'Save',
              style: TextStyles.font14blueMedium,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyles.fon14DarkMedium,
            ),
            AppTextFormField(hintText: 'Abduallah Mohaamed', validator: (value) {}),
            verticalSpace(10),
            Text(
              'Phone Number',
              style: TextStyles.fon14DarkMedium,
            ),
            AppTextFormField(hintText: '0511936532', validator: (value) {}),
            Text(
              'Commercial Registration',
              style: TextStyles.fon14DarkMedium,
            ),
            AppTextFormField(hintText: '37204839363922', validator: (value) {}),
            verticalSpace(10),
            Text(
              'ID Number',
              style: TextStyles.fon14DarkMedium,
            ),
            AppTextFormField(hintText: '11103822456', validator: (value) {}),
            verticalSpace(10),
            Text(
              'Bank Account',
              style: TextStyles.fon14DarkMedium,
            ),
            AppTextFormField(hintText: 'IBAN', validator: (value) {}),
            verticalSpace(12),
            AppTextFormField(hintText: 'SA', validator: (value) {}),
            verticalSpace(12),
            AppTextFormField(hintText: 'Name', validator: (value) {}),
            verticalSpace(10),
            Text(
              'VAT Number',
              style: TextStyles.fon14DarkMedium,
            ),
            AppTextFormField(hintText: '11103822456', validator: (value) {}),
          ],
        ),
      ),
    );
  }
}
