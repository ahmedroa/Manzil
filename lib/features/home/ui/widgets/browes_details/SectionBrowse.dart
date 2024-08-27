import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';

import 'package:manzil/features/home/ui/widgets/browes_details/browes_details_bloc_builder.dart';

class SectionBrowse extends StatefulWidget {
  const SectionBrowse({super.key});

  @override
  _SectionBrowseState createState() => _SectionBrowseState();
}

class _SectionBrowseState extends State<SectionBrowse> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                horizontalSpace(12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text('Monthly',
                              style: _selectedOption == 0
                                  ? const TextStyle(
                                      color: ColorsManager.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )
                                  : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2))),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text('3 months',
                              style: _selectedOption == 0
                                  ? const TextStyle(
                                      color: ColorsManager.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )
                                  : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2))),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text('3 months',
                              style: _selectedOption == 0
                                  ? const TextStyle(
                                      color: ColorsManager.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )
                                  : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2))),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text('Yearly',
                              style: _selectedOption == 0
                                  ? const TextStyle(
                                      color: ColorsManager.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )
                                  : const TextStyle(fontSize: 14, color: Color(0xffA2A2A2))),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(12),
              ],
            ),
          ),
          _selectedOption == 0
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BrowesDetailsBlocBuilder(),
                )
              : _selectedOption == 1
                  ? Container()
                  : Container()
        ],
      ),
    );
  }
}
