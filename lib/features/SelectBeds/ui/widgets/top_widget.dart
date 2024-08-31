import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/icon.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key});

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  bool containerColor = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
          width: 0.3,
          color: Colors.grey,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        containerColor = !containerColor;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: containerColor ? ColorsManager.kPrimaryColor : ColorsManager.containerBlue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          IconsManger.top,
                          color: containerColor ? Colors.white : ColorsManager.kPrimaryColor,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(40),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorsManager.kPrimaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        IconsManger.top,
                        color: Colors.white,
                        height: 30,
                      ),
                    ),
                  ),
                  horizontalSpace(12),
                ],
              ),
              verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorsManager.containerBlue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            IconsManger.top,
                            height: 30,
                          ),
                        ),
                      ),
                      verticalSpace(30),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorsManager.containerBlue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            IconsManger.top,
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorsManager.kPrimaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        IconsManger.top,
                        color: Colors.white,
                        height: 30,
                      ),
                    ),
                  ),
                  horizontalSpace(12),
                ],
              ),
              verticalSpace(20),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: ColorsManager.kPrimaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    IconsManger.top,
                    color: Colors.white,
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
