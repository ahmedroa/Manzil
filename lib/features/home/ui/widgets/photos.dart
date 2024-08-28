import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/ui/widgets/photo_view_screen.dart';

class Photos extends StatelessWidget {
  const Photos({super.key, required this.unitList});

  final UnitModle unitList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Photos', style: TextStyles.fon16DarkMedium),
        verticalSpace(12),
        SizedBox(
          height: 140,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: List.generate(unitList.picturesOfUnity?.length ?? 0, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoViewScreen(
                        images: unitList.picturesOfUnity!,
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Image.network(
                  unitList.picturesOfUnity![index],
                  fit: BoxFit.cover,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
