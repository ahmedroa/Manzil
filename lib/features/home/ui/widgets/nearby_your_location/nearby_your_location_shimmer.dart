import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class NearbyYourLocationShimmer extends StatelessWidget {
  const NearbyYourLocationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(12),
            Shimmer.fromColors(
              baseColor: ColorsManager.lightGray,
              highlightColor: Colors.white,
              child: Container(
                height: 18.h,
                width: 170.w,
                decoration: BoxDecoration(
                  color: ColorsManager.lightGray,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            verticalSpace(12),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 100.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: ColorsManager.lightGray,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 18.h,
                              width: 170.w,
                              decoration: BoxDecoration(
                                color: ColorsManager.lightGray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Shimmer.fromColors(
                            baseColor: ColorsManager.lightGray,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 18.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: ColorsManager.lightGray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      verticalSpace(12),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: ColorsManager.lightGray,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 14.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: ColorsManager.lightGray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Shimmer.fromColors(
                            baseColor: ColorsManager.lightGray,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 20.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: ColorsManager.lightGray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
