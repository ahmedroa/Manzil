import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';

import '../../logic/cubit/select_beds_cubit.dart';

class SelectRoom extends StatefulWidget {
  const SelectRoom({super.key});

  @override
  State<SelectRoom> createState() => _SelectRoomState();
}

class _SelectRoomState extends State<SelectRoom> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SelectBedsCubit>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: .4,
                  color: const Color(0xffA2A2A2),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<SelectBedsCubit>(context).selectRoom('room 1');
                      setState(() {
                        cubit.selectedOption = 0;
                      });
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: cubit.selectedOption == 0 ? ColorsManager.kPrimaryColor : Colors.transparent,
                            width: cubit.selectedOption == 0 ? 2 : 0,
                          ),
                        ),
                      ),
                      child: Text(
                        'room 1',
                        style: cubit.selectedOption == 0
                            ? const TextStyle(
                                color: ColorsManager.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )
                            : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2)),
                      ),
                    ),
                  ),
                  horizontalSpace(15),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<SelectBedsCubit>(context).selectRoom('room 2');
                      setState(() {
                        cubit.selectedOption = 1;
                      });
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: cubit.selectedOption == 1 ? ColorsManager.kPrimaryColor : Colors.transparent,
                            width: cubit.selectedOption == 1 ? 2 : 0,
                          ),
                        ),
                      ),
                      child: Text(
                        'room 2',
                        style: cubit.selectedOption == 1
                            ? const TextStyle(
                                color: ColorsManager.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )
                            : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2)),
                      ),
                    ),
                  ),
                  horizontalSpace(15),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<SelectBedsCubit>(context).selectRoom('room 3');

                      setState(() {
                        cubit.selectedOption = 2;
                      });
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: cubit.selectedOption == 2 ? ColorsManager.kPrimaryColor : Colors.transparent,
                            width: cubit.selectedOption == 2 ? 2 : 0,
                          ),
                        ),
                      ),
                      child: Text(
                        'room 3',
                        style: cubit.selectedOption == 2
                            ? const TextStyle(
                                color: ColorsManager.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )
                            : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
