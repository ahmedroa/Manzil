import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/main_button.dart';
import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';
import 'package:manzil/features/SelectBeds/ui/screens/select_beds.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/ui/screens/details.dart';
import 'package:shimmer/shimmer.dart';

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
        width: 320.h,
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
              CachedNetworkImage(
                imageUrl: '${unitList.img}',
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Shimmer.fromColors(
                    baseColor: ColorsManager.lightGray,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 230.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) => Container(
                  height: 230.h,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: MainButton(
                            width: 90,
                            text: 'Reserve',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => SelectBedsCubit()..fetchUnits(''),
                                      child: SelectBeds(
                                        price: formattedPrice,
                                        unitId: "${unitList.id}",
                                      ),
                                    ),
                                  ));
                            },
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
