import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/widgets/Divider.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/core/widgets/icon.dart';

class FollowUs extends StatelessWidget {
  const FollowUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Follow Us'),
        leading: goBackWidget(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            buildOption(title: 'Linkedin ', icon: IconsManger.linkdin, onTap: () {}),
            const DividerWidget(),
            buildOption(title: 'TikTok', icon: IconsManger.tiktok, onTap: () {}),
            const DividerWidget(),
            buildOption(title: 'Instagram', icon: IconsManger.instegram, onTap: () {}),
          ],
        ),
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
