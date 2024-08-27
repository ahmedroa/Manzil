import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';

class BrowesDetails extends StatelessWidget {
  const BrowesDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          verticalSpace(20),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.containerColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.20),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/home.png',
                        fit: BoxFit.cover,
                      )),
                  verticalSpace(12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alryan, Riyadh Saudi Arabia',
                          style: TextStyles.fon12GreyRegular,
                        ),
                        Text(
                          'Furnished Apartment',
                          style: TextStyles.font14blueMedium,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price / per bed',
                                  style: TextStyles.fon12GreyRegular,
                                ),
                                Text(
                                  '1220 SAR',
                                  style: TextStyles.fon15DarkRegular,
                                ),
                              ],
                            ),
                            const Spacer(),
                            MainButton(
                              width: 110,
                              text: 'Reseve',
                              onTap: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(12),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
