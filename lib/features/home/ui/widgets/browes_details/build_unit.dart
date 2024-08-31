import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/ui/screens/details.dart';

class BuildUnit extends StatelessWidget {
  final UnitModle unitList;

  const BuildUnit({super.key, required this.unitList});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,##0', 'en_US').format(unitList.price);

    return GestureDetector(
      onTap: () {
        navigateTo(context, Details(unitList: unitList));
      },
      child: Container(
        width: 320,
        // height: 360,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '${unitList.img}',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
              // Image.asset(
              //   'assets/home.png',
              //   width: double.infinity,
              //   height: 230,
              //   fit: BoxFit.cover,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          unitList.name,
                          style: TextStyles.font14blueMedium,
                        ),
                        const Spacer(),
                        const Icon(Icons.star, color: ColorsManager.yellow),
                        Text(
                          '4.19',
                          style: TextStyles.fon15DarkRegular,
                        ),
                      ],
                    ),
                    Text(
                      unitList.location,
                      style: TextStyles.fon12GreyRegular,
                    ),
                    // horizontalSpace(12),
                    verticalSpace(12),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$formattedPrice SAR',
                              style: TextStyles.fon15DarkRegular,
                            ),
                            Text(
                              'Price / per bed',
                              style: TextStyles.fon12GreyRegular,
                            ),
                          ],
                        ),
                        const Spacer(),
                        MainButton(
                          width: 90,
                          text: 'Reserve',
                          onTap: () {},
                        ),
                      ],
                    ),
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
