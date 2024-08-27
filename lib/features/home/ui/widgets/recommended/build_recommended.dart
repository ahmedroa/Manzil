import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/ui/screens/details.dart';

class BuildRecommended extends StatelessWidget {
  final UnitModle unitList;

  const BuildRecommended({super.key, required this.unitList});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,##0', 'en_RA').format(unitList.price);

    return GestureDetector(
      onTap: () {
        navigateTo(context, Details(unitList: unitList));
      },
      child: Container(
        width: 320,
        height: 338,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.10),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  'assets/home.png',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          unitList.name,
                          style: TextStyles.font16PrimaryColorRegular,
                        ),
                        Text(
                          unitList.location,
                          style: TextStyles.fon12GreyRegular,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              Text(
                                '$formattedPrice SAR',
                                style: TextStyles.fon15DarkBold,
                              ),
                              horizontalSpace(8),
                              Text(
                                'Price / per bed',
                                style: TextStyles.fon12GreyRegular,
                              ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, color: ColorsManager.yellow),
                            Text(
                              '4.19',
                              style: TextStyles.fon15DarkRegular,
                            ),
                          ],
                        ),
                        // verticalSpace(12),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: MainButton(
                            width: 90,
                            text: 'Reserve',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
