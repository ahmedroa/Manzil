// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/Manzil.dart';
import 'package:manzil/core/routing/routes.dart';
import 'package:manzil/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  runApp(Manzil(
    appRouter: AppRouter(),
  ));
}


// logo 
// Add id unit in collection + model
// splash screen
// otp verification
// seraach Browse 
// past Reservation
// reservation
// loading image
// loading photos from firebase
// apple pay ?? andorid  *
// animation
// card_swiper
// Exception internet
