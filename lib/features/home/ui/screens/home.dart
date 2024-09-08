import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/home/ui/widgets/nearby_your_location/nearby_your_location_bloc_builder.dart';
import 'package:manzil/features/home/ui/widgets/advertisement.dart';
import 'package:manzil/features/home/ui/widgets/recommended/recommended_bloc_builder.dart';
import 'package:manzil/features/BottomNavBar/logic/BottomNavCubit.dart';

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
        leading: IconButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('unit').doc('ryyJDjcvI0zoOWdCFbx6').collection('top').add({
                '1': 'available',
                '2': 'available',
                '3': 'available',
                '4': 'not available',
                '5': 'available',
                '6': 'available',
              });
            },
            icon: const Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Advertisement(),
              verticalSpace(10),
              recommendedForYouSeeAll(context),
              verticalSpace(10),
              const RecommendedBlocBuilder(),
              verticalSpace(20),
              nearbyYourLocation(context),
              verticalSpace(10),
              const NearbyYourLocationBlocBuilder(),
              // const RecommendedShimmer(),
              verticalSpace(20)
            ],
          ),
        ),
      ),
    );
  }
}

Row recommendedForYouSeeAll(BuildContext context) {
  return Row(
    children: [
      Text(
        'Recommended for you',
        style: TextStyles.font18DarkMedium,
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(1);
        },
        child: Text(
          'See all',
          style: TextStyles.font14blueMedium,
        ),
      ),
    ],
  );
}

Row nearbyYourLocation(BuildContext context) {
  return Row(
    children: [
      Text(
        'Nearby your location',
        style: TextStyles.font18DarkMedium,
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(1);
        },
        child: Text(
          'See all',
          style: TextStyles.font14blueMedium,
        ),
      ),
    ],
  );
}
