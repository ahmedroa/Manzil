// ignore_for_file: unused_field, unused_element, deprecated_member_use, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/BottomNavBar/logic/BottomNavCubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, int>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BottomNavCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: ColorsManager.icontGrey,
            elevation: 20,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: state == 0 ? Colors.blue : Colors.grey),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconsManger.waterfalls, color: state == 1 ? Colors.blue : Colors.grey),
                label: 'Browse',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(IconsManger.transaction, color: state == 2 ? Colors.blue : Colors.grey),
                label: 'Reservations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined, color: state == 3 ? Colors.blue : Colors.grey),
                label: 'Profile',
              ),
            ],
            showUnselectedLabels: true,
            currentIndex: state,
            selectedItemColor: ColorsManager.kPrimaryColor,
            onTap: (index) {
              cubit.changeSelectedIndex(index);
            },
          ),
          body: SafeArea(
            child: Center(
              child: BottomNavCubit.screens[state],
            ),
          ),
        );
      },
    );
  }
}
