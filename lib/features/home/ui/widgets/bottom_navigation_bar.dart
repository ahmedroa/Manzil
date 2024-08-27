// ignore_for_file: unused_field, unused_element, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/icon.dart';

import 'package:manzil/features/home/logic/cubit/home_cubit.dart';
import 'package:manzil/features/home/logic/cubit/home_state.dart';

// Flutter code sample for [BottomNavigationBar].

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: ColorsManager.icontGrey,
            elevation: 20,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: cubit.currentIndex == 0 ? Colors.blue : Colors.grey),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconsManger.waterfalls,
                    color: cubit.currentIndex == 1 ? Colors.blue : Colors.grey),
                label: 'Browse',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconsManger.transaction,
                    color: cubit.currentIndex == 2 ? Colors.blue : Colors.grey),
                label: 'Reservations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined, color: cubit.currentIndex == 3 ? Colors.blue : Colors.grey),
                label: 'Profile',
              ),
            ],
            showUnselectedLabels: true,
            currentIndex: cubit.currentIndex,
            selectedItemColor: ColorsManager.kPrimaryColor,
            onTap: (index) {
              cubit.chengeBottomNavBar(index);
            },
          ),
          body: SafeArea(
            child: Center(
              child: HomeCubit.screens[cubit.currentIndex],
            ),
          ),
        );
      },
    );
  }
}


// import 'package:manzil/features/home/data/model/unit.dart';
// import 'package:manzil/features/home/ui/screens/details.dart';

// class BuildRecommended extends StatelessWidget {
//   final UnitModle unitList;

//   const BuildRecommended({super.key, required this.unitList});

//   @override
//   Widget build(BuildContext context) {
//     final formattedPrice = NumberFormat('#,##0', 'en_US').format(unitList.price);

//     return GestureDetector(
//       onTap: () {
//         // context.pushNamed(Routes.d)
//         navigateTo(context, Details(unitList: unitList));
//       },
//       child: Container(
//         width: 320,
//         height: 350,
//         margin: const EdgeInsets.only(right: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.20),
//               spreadRadius: 1,
//               blurRadius: 2,
//               offset: const Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 child: Image.asset(
//                   'assets/home.png',
//                   width: double.infinity,
//                   height: 230,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           unitList.name,
//                           style: TextStyles.font16PrimaryColorRegular,
//                         ),
//                         Text(
//                           unitList.location,
//                           style: TextStyles.fon12GreyRegular,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               '$formattedPrice SAR',
//                               style: TextStyles.fon15DarkBold,
//                             ),
//                             horizontalSpace(8),
//                             Text(
//                               'Price / per bed',
//                               style: TextStyles.fon12GreyRegular,
//                             ),
//                             // const Spacer(),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     MainButton(
//                       width: 90,
//                       text: 'Reserve',
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
