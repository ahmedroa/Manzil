import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';
import 'package:manzil/features/SelectBeds/ui/screens/select_beds.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/ui/widgets/photos.dart';
import 'package:shimmer/shimmer.dart';

class Details extends StatelessWidget {
  final UnitModle unitList;

  const Details({super.key, required this.unitList});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat('#,##0', 'en_US').format(unitList.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: goBackWidget(context),
        title: Text(
          'Details',
          style: TextStyles.fon18DarkMedium,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailsUnit(unitList: unitList, formattedPrice: formattedPrice),

                  verticalSpace(12),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.containerColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        horizontalSpace(12),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/bed.svg'),
                                  horizontalSpace(5),
                                  Text(
                                    '1 Bed',
                                    style: TextStyles.fon12DarkRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/bath.svg'),
                                  horizontalSpace(5),
                                  Text(
                                    '1 Bath',
                                    style: TextStyles.fon12DarkRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/bed.svg'),
                                  horizontalSpace(5),
                                  Text(
                                    '325 sqm',
                                    style: TextStyles.fon12DarkRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                      ],
                    ),
                  ),
                  description(),
                  features(),
                  Photos(unitList: unitList),
                  // verticalSpace(12),
                  propertySpecifications(context)
                ],
              ),
            ),
            verticalSpace(12),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price / per bed',
                        style: TextStyles.font14GreyMedium,
                      ),
                      Text('$formattedPrice SAR Monthly', style: TextStyles.fon18DarkSemiBold),
                    ],
                  ),
                  const Spacer(),
                  MainButton(
                    text: 'Reseve',
                    onTap: () {
                      // context.pushNamed(Routes.selectBeds, arguments: unitList.id);
                      //                   if (unitList.id != null && unitList.id!.isNotEmpty) {
                      // SelectBedsCubit()..getBeds(unitList.id!);
// }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => SelectBedsCubit()..getBeds(unitList.id!),
                              child: SelectBeds(
                                price: formattedPrice,
                              ),
                            ),
                          ));
                    },
                    width: 120,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Column features() {
    return Column(
      children: [
        Row(
          children: [
            Text('Features', style: TextStyles.fon16DarkMedium),
            const Spacer(),
            GestureDetector(onTap: () {}, child: Text('See all', style: TextStyles.font14blueMedium)),
          ],
        ),
        verticalSpace(12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.containerColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Row(
              children: [
                horizontalSpace(8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/Wifi.svg'),
                              Text('Wi-Fi', style: TextStyles.fon14DarkMedium),
                              Text('+Extra Charge', style: TextStyles.fon10GreyRegular),
                            ],
                          ),
                        )),
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/Wifi.svg'),
                              Text('Wi-Fi', style: TextStyles.fon14DarkMedium),
                              Text('+Extra Charge', style: TextStyles.fon10GreyRegular),
                            ],
                          ),
                        )),
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/Wifi.svg'),
                              Text('Wi-Fi', style: TextStyles.fon14DarkMedium),
                              Text('+Extra Charge', style: TextStyles.fon10GreyRegular),
                            ],
                          ),
                        )),
                  ),
                ),
                horizontalSpace(8),
              ],
            ),
          ),
        ),
        verticalSpace(12),
      ],
    );
  }

  Column description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(12),
        Text('Description', style: TextStyles.fon16DarkMedium),
        verticalSpace(12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.containerColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '${unitList.description}',
              style: TextStyles.font14GreyRegular,
            ),
          ),
        ),
        verticalSpace(12),
      ],
    );
  }

  detailsUnit({required UnitModle unitList, required String formattedPrice}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: CachedNetworkImage(
            imageUrl: '${unitList.img}',
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: ColorsManager.lightGray,
                highlightColor: Colors.white,
                child: Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              height: 300.h,
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
        ),
        verticalSpace(12),
        Row(
          children: [
            Text(
              unitList.name,
              style: TextStyles.font18BluekRegular,
            ),
            const Spacer(),
            const Icon(
              Icons.share,
              color: Colors.grey,
            )
          ],
        ),
        Text(
          unitList.location,
          style: TextStyles.font14GreyRegular,

          // style: TextStyles.font14blueMedium.copyWith(fontSize: 18),
        ),
        verticalSpace(4),
        Row(
          children: [
            Text(formattedPrice, style: TextStyles.fon18DarkMedium),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SAR', style: TextStyles.fon10DarkRegular),
                Text('+ 261 SAR For VAT and processing fees', style: TextStyles.fon8GreyRegular),
              ],
            )
          ],
        ),
      ],
    );
  }

  propertySpecifications(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Property Specifications', style: TextStyles.fon16DarkMedium),
        Container(
          width: 54,
          height: 4,
          color: ColorsManager.kPrimaryColor,
        ),
        verticalSpace(12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Numbers of beds', style: TextStyles.fon10GreyRegular),
                        Text(unitList.numbersOfBeds, style: TextStyles.fon14DarkMedium),
                      ],
                    ),
                    horizontalSpace(MediaQuery.of(context).size.width * 0.3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Numbers of bathrooms', style: TextStyles.fon10GreyRegular),
                        Text('3', style: TextStyles.fon14DarkMedium),
                      ],
                    ),
                  ],
                ),
                verticalSpace(12),
                Text('Property Area', style: TextStyles.fon10GreyRegular),
                Text('${unitList.propertyArea} Meter Square', style: TextStyles.fon14DarkMedium),
                verticalSpace(12),
                Text('Location', style: TextStyles.fon10GreyRegular),
                Text(unitList.location, style: TextStyles.fon14DarkMedium),
                verticalSpace(8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
