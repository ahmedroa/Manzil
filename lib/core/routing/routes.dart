import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/core/routing/app_router.dart';
import 'package:manzil/features/Checkout/logic/Checkout_cubit.dart';
import 'package:manzil/features/Checkout/ui/screens/checkout.dart';
import 'package:manzil/features/SelectBeds/logic/cubit/select_beds_cubit.dart';
import 'package:manzil/features/auth/logic/auth_cubit.dart';
import 'package:manzil/features/auth/ui/screen/VerificationCode.dart';
import 'package:manzil/features/auth/ui/screen/login.dart';
import 'package:manzil/features/SelectBeds/ui/screens/select_beds.dart';
import 'package:manzil/features/BottomNavBar/widget/bottom_navigation_bar.dart';
import 'package:manzil/features/setting/ui/screens/FollowUs.dart';
import 'package:manzil/features/setting/ui/screens/Language.dart';
import 'package:manzil/features/setting/ui/screens/MyProfile.dart';
import 'package:manzil/features/setting/ui/screens/TermsAndConditions.dart';
import 'package:manzil/features/BottomNavBar/logic/BottomNavCubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PhoneAuthCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PhoneAuthCubit(),
            child: VerificationCode(
              phoneNumber: settings.arguments as String,
            ),
          ),
        );
      case Routes.bottomNavBar:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => BottomNavCubit(),
            child: const BottomNavBar(),
          ),
        );
      case Routes.checkout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CheckoutCubit(),
            child: const Checkout(),
          ),
        );
      case Routes.selectBeds:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SelectBedsCubit()..getBeds(''),
            child: SelectBeds(
              price: settings.arguments as int,
              unitId: settings.arguments as String,
            ),
          ),
        );

      case Routes.myProfile:
        return MaterialPageRoute(
          builder: (_) => const MyProfile(),
        );
      case Routes.termsAndConditions:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditions(),
        );
      case Routes.language:
        return MaterialPageRoute(
          builder: (_) => const Language(),
        );
      case Routes.followUs:
        return MaterialPageRoute(
          builder: (_) => const FollowUs(),
        );

      default:
        return null;
    }
  }
}
