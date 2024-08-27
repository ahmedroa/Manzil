import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/home/logic/cubit/home_cubit.dart';
import 'package:manzil/features/home/ui/widgets/nearby_your_location/nearby_your_location_bloc_builder.dart';
import 'package:manzil/features/home/ui/widgets/advertisement.dart';
import 'package:manzil/features/home/ui/widgets/recommended/recommended_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          IconsManger.logo,
          color: ColorsManager.kPrimaryColor,
          width: 190,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Advertisement(),
              verticalSpace(10),
              recommendedForYouSeeAll(),
              verticalSpace(10),
              const RecommendedBlocBuilder(),
              verticalSpace(20),
              nearbyYourLocation(context),
              verticalSpace(10),
              const NearbyYourLocationBlocBuilder(),
              verticalSpace(20)
            ],
          ),
        ),
      ),
    );
  }
}

Row recommendedForYouSeeAll() {
  return Row(
    children: [
      Text(
        'Recommended for you',
        style: TextStyles.fon18DarkMedium,
      ),
      const Spacer(),
      Text(
        'See all',
        style: TextStyles.font14blueMedium,
      ),
    ],
  );
}

Row nearbyYourLocation(BuildContext context) {
  return Row(
    children: [
      Text(
        'Nearby your location',
        style: TextStyles.fon18DarkMedium,
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          HomeCubit.get(context).chengeBottomNavBar(2);
        },
        child: Text(
          'See all',
          style: TextStyles.font14blueMedium,
        ),
      ),
    ],
  );
}
