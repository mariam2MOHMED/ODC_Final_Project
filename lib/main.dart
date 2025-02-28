import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:odcorange/core/db/cach_helper/cach_helper.dart';
import 'package:odcorange/core/fcm/fcm.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';
import 'package:odcorange/features/cart/presentation/screens/order_screen.dart';
import 'package:odcorange/features/home/presentation/screens/privacy_policy_screen.dart';
import 'package:odcorange/features/intro/splash_screen.dart';
import 'package:odcorange/features/payment/presentation/view/screen/add_new_card.dart';
import 'package:odcorange/firebase_options.dart';

import 'core/db/local_db/local_db.dart';
import 'core/network/remote/dio_helper.dart';
import 'features/home/presentation/screens/home_page.dart';
import 'features/on_boarding/presentation/view/screens/on_boarding_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await SQLHelper.initDb();
  DioHelper.init();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Fcm.fcmInit();
  runApp(ScreenUtilInit(
    designSize: Size(375, 812),
    minTextAdapt: true,
    builder: (context, _) {
      return StoreApp();
    },
  ));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
