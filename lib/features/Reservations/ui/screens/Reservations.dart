import 'package:flutter/material.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/widgets/icon.dart';

import 'package:manzil/features/Reservations/ui/widgets/section_reservations.dart';

class Reservations extends StatelessWidget {
  const Reservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          IconsManger.logo,
          color: ColorsManager.kPrimaryColor,
          width: 190,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SectionReservations(),
          ],
        ),
      ),
    );
  }
}
