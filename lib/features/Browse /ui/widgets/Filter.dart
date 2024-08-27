import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';

class FilterBrowse extends StatefulWidget {
  const FilterBrowse({super.key});

  @override
  State<FilterBrowse> createState() => _FilterBrowseState();
}

class _FilterBrowseState extends State<FilterBrowse> {
  bool currentMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpace(10),
              // SvgPicture.asset(MyIcons.indicator),
              verticalSpace(20),
              Text('City', style: TextStyles.fon18DarkMedium),
              verticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey, width: .6),
                    ),
                    child: Text(
                      'Riyadh',
                      style: TextStyles.font14GreyRegular,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  horizontalSpace(8),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey, width: .6),
                    ),
                    child: Text(
                      'Jeddah',
                      style: TextStyles.font14GreyRegular,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  horizontalSpace(8),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey, width: .6),
                    ),
                    child: Text(
                      'Dammam',
                      style: TextStyles.font14GreyRegular,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  horizontalSpace(8),
                ],
              ),
              verticalSpace(10),
              const Divider(),
              Text('Location', style: TextStyles.fon18DarkMedium),
              verticalSpace(10),

              Row(
                children: [
                  buildItem(
                    title: 'North',
                  ),
                  horizontalSpace(12),
                  buildItem(
                    title: 'South',
                  ),
                  horizontalSpace(12),
                  buildItem(
                    title: 'West',
                  ),
                  horizontalSpace(12),
                  buildItem(
                    title: 'East',
                  ),
                ],
              ),
              verticalSpace(10),

              const Divider(),
              verticalSpace(10),

              Text('number of beds available', style: TextStyles.fon18DarkMedium),
              verticalSpace(10),
              Row(children: [
                buildItem(
                  title: '1',
                ),
                horizontalSpace(12),
                buildItem(
                  title: '2',
                ),
                horizontalSpace(12),
                buildItem(
                  title: '3',
                ),
                horizontalSpace(12),
                buildItem(
                  title: '4',
                ),
                horizontalSpace(12),
                buildItem(
                  title: '5',
                ),
                horizontalSpace(12),
              ]),

              const Divider(),

              verticalSpace(20),
              MainButton(text: 'Show 2 results', onTap: () {}),
              verticalSpace(10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Reset',
                  style: TextStyles.fon16DarkMedium,
                ),
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  buildItem({required String title, bool? isSelected}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey, width: .6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
