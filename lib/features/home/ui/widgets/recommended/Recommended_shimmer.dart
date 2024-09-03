import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedShimmer extends StatelessWidget {
  const RecommendedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(2, (index) {
          return Container(
            width: 320.h,
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 180.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
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
          );
        }),
      ),
    );
  }
}

// class RecommendedShimmer extends StatelessWidget {
//   const RecommendedShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Shimmer.fromColors(
//                 baseColor: ColorsManager.lightGray,
//                 highlightColor: Colors.white,
//                 child: Container(
//                   height: 180.h,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.circular(12.0),
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               verticalSpace(12),
//               Row(
//                 children: [
//                   Shimmer.fromColors(
//                     baseColor: ColorsManager.lightGray,
//                     highlightColor: Colors.white,
//                     child: Container(
//                       height: 18.h,
//                       width: 170.w,
//                       decoration: BoxDecoration(
//                         color: ColorsManager.lightGray,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   Shimmer.fromColors(
//                     baseColor: ColorsManager.lightGray,
//                     highlightColor: Colors.white,
//                     child: Container(
//                       height: 18.h,
//                       width: 30.w,
//                       decoration: BoxDecoration(
//                         color: ColorsManager.lightGray,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               verticalSpace(12),
//               Shimmer.fromColors(
//                 baseColor: ColorsManager.lightGray,
//                 highlightColor: Colors.white,
//                 child: Container(
//                   height: 14.h,
//                   width: 160.w,
//                   decoration: BoxDecoration(
//                     color: ColorsManager.lightGray,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               verticalSpace(12),
//               Row(
//                 children: [
//                   Shimmer.fromColors(
//                     baseColor: ColorsManager.lightGray,
//                     highlightColor: Colors.white,
//                     child: Container(
//                       height: 14.h,
//                       width: 80.w,
//                       decoration: BoxDecoration(
//                         color: ColorsManager.lightGray,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   Shimmer.fromColors(
//                     baseColor: ColorsManager.lightGray,
//                     highlightColor: Colors.white,
//                     child: Container(
//                       height: 20.h,
//                       width: 60.w,
//                       decoration: BoxDecoration(
//                         color: ColorsManager.lightGray,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
