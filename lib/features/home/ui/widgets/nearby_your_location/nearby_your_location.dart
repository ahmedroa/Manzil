import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';
import 'package:manzil/features/SelectBeds/ui/screens/select_beds.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/ui/screens/details.dart';
import 'package:shimmer/shimmer.dart';

class NearbyYourLocation extends StatelessWidget {
  final UnitModle unitList;
  const NearbyYourLocation({super.key, required this.unitList});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,##0', 'en_US').format(unitList.price);

    return GestureDetector(
      onTap: () {
        navigateTo(context, Details(unitList: unitList));
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
              offset: const Offset(
                0,
                1,
              ),
            ),
          ],
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: '${unitList.img}',
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                );
              },
              imageBuilder: (context, imageProvider) => Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            horizontalSpace(15),
            Flexible(
              child: Column(
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
                      Flexible(
                        child: Text(
                          'Price / per bed',
                          style: TextStyles.fon12GreyRegular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: MainButton(
                width: 90,
                text: 'Reserve',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => SelectBedsCubit()..getBeds(unitList.id!),
                          child: const SelectBeds(),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
