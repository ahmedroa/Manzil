import 'package:flutter/material.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/goBack.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        leading: goBackWidget(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            RadioListTile<int>(
              value: 1,
              activeColor: ColorsManager.kPrimaryColor,
              groupValue: selectedOption,
              title: const Text(
                'English',
              ),
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            RadioListTile<int>(
              value: 2,
              activeColor: ColorsManager.kPrimaryColor,
              groupValue: selectedOption,
              title: const Text(
                'Arabic',
              ),
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
