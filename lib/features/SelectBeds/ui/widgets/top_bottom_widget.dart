// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:manzil/core/helpers/spacing.dart';
// import 'package:manzil/core/theme/colors.dart';
// import 'package:manzil/core/theme/styles.dart';
// import 'package:manzil/core/widgets/icon.dart';
// import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';
// import 'package:manzil/features/SelectBeds/ui/widgets/bottom_widget.dart';
// import 'package:manzil/features/SelectBeds/ui/widgets/top_widget.dart';

// class TopBottomWidget extends StatefulWidget {
//   const TopBottomWidget({super.key});

//   @override
//   State<TopBottomWidget> createState() => _TopBottomWidgetState();
// }

// class _TopBottomWidgetState extends State<TopBottomWidget> {
//   @override
//   Widget build(BuildContext context) {
//     var cubit = BlocProvider.of<SelectBedsCubit>(context);

//     return Column(
//       children: [
//         Container(
//           color: ColorsManager.containerColor,
//           width: double.infinity,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     cubit.selectBed('bottom');
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 400),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 1,
//                         color:
//                             cubit.selectedBeds == 'bottom' ? ColorsManager.kPrimaryColor : ColorsManager.containerColor,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20, right: 20),
//                       child: Row(
//                         children: [
//                           SvgPicture.asset(
//                             IconsManger.bottom,
//                             height: 30,
//                           ),
//                           horizontalSpace(10),
//                           Text(
//                             'bottom',
//                             style: TextStyles.fon12DarkRegular,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     cubit.selectBed('top');
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 400),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 1,
//                         color: cubit.selectedBeds == 'top' ? ColorsManager.kPrimaryColor : ColorsManager.containerColor,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 28, right: 28),
//                       child: Row(
//                         children: [
//                           SvgPicture.asset(
//                             IconsManger.top,
//                             height: 30,
//                           ),
//                           horizontalSpace(10),
//                           Text(
//                             'Top',
//                             style: TextStyles.fon12DarkRegular,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         verticalSpace(40),
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 500),
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           child: cubit.selectedBeds == 'top'
//               ? const TopWidget(key: ValueKey('TopWidget'))
//               : const BottomWidget(key: ValueKey('bottomWidget')),
//         ),
//       ],
//     );
//   }
// }
