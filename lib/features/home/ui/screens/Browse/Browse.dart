import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/AppTextFormField.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/home/ui/widgets/browes_details/section_browse.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          IconsManger.logo,
          color: ColorsManager.kPrimaryColor,
          width: 190,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      hintText: 'Seareh',
                      hintStyle: const TextStyle(
                        color: ColorsManager.icontGrey,
                        fontSize: 14,
                      ),
                      validator: (p0) {},
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: .4),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: ColorsManager.icontGrey,
                        size: 24,
                      ),
                    ),
                  ),
                  horizontalSpace(20),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsManager.containerBlue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        IconsManger.filter,
                        color: ColorsManager.kPrimaryColor,
                        // width: 15,
                        // height: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            const SectionBrowse(),
          ],
        ),
      ),
    );
  }
}
