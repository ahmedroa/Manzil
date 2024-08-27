import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/icon.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.h, right: 20.h),
          child: Column(
            children: [
              verticalSpace(MediaQuery.of(context).size.height * 0.2),
              Image.asset(
                IconsManger.logo,
                color: ColorsManager.kPrimaryColor,
              ),
              const Spacer(),
              MainButton(text: 'Sign up', onTap: () {}),
              verticalSpace(10),
              TextButton(
                  onPressed: () async {},
                  child: Text(
                    'Sign in',
                    style: TextStyles.font14blueMedium,
                  )),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
