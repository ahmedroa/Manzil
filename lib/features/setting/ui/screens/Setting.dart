import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/extensions.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/routing/app_router.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/setting/ui/screens/TermsAndConditions.dart';
import 'package:manzil/features/setting/ui/widgets/AppBarSetting.dart';
import 'package:manzil/features/setting/ui/widgets/logoutWidget.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppBarSetting(),
          buildOption(
            title: 'My profile',
            icon: IconsManger.afferent,
            onTap: () {
              context.pushNamed(Routes.myProfile);
            },
          ),
          const Divider(),
          buildOption(
            title: 'Terms and conditions',
            icon: IconsManger.afferent,
            onTap: () {
              context.pushNamed(Routes.termsAndConditions);
              navigateTo(context, const TermsAndConditions());
            },
          ),
          const Divider(),
          buildOption(
            title: 'Language',
            icon: IconsManger.afferent,
            onTap: () {
              context.pushNamed(Routes.language);
            },
          ),
          const Divider(),
          buildOption(
            title: 'Follow us',
            icon: IconsManger.afferent,
            onTap: () {
              context.pushNamed(Routes.followUs);
            },
          ),
          const Divider(),
          buildOption(
            title: 'Contact us',
            icon: IconsManger.afferent,
            onTap: () {},
          ),
          const Divider(),
          buildOption(
            title: 'Log out',
            icon: IconsManger.afferent,
            onTap: () {
              logoutWidget(context);
            },
          ),
          verticalSpace(20),
          TextButton(
            onPressed: () {},
            child: Text('Delete Account', style: TextStyles.font15RedMedium),
          ),
        ],
      ),
    );
  }

  buildOption({
    required String title,
    required String icon,
    required void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 12),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                SvgPicture.asset(icon),
                horizontalSpace(12),
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
