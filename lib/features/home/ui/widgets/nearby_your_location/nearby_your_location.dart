import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/details/ui/screens/details.dart';

class NearbyYourLocation extends StatelessWidget {
  final UnitModle unitList;
  const NearbyYourLocation({super.key, required this.unitList});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,##0', 'en_US').format(unitList.price);

    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            Details(
              unitList: unitList,
            ));
      },
      child: Container(
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${unitList.img}',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            // Image.asset(
            //   'assets/home.png',
            //   width: 70,
            //   height: 70,
            // ),
            horizontalSpace(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unitList.name,
                  style: TextStyles.font16blueRegular,
                ),
                Text(
                  unitList.location,
                  style: TextStyles.fon12GreyRegular,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '$formattedPrice SAR',
                      style: TextStyles.font15DarkBold,
                    ),
                    horizontalSpace(4),
                    Text(
                      'Price / per bed',
                      style: TextStyles.fon12GreyRegular,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: MainButton(
                width: 90,
                text: 'Reseve',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
