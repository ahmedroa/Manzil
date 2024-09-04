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

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageViewExample(),
    );
  }
}

class PageViewExample extends StatelessWidget {
  final PageController _pageController = PageController();

  PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Example'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Page 1',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Page 2',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Page 3',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// logo 
// serach Browse 
// past Reservation
// reservation
// loading features from firebase
// Exception internet
