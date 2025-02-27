import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/db/cach_helper/cach_helper.dart';
import 'package:odcorange/features/home/presentation/screens/home_page.dart';
import 'package:odcorange/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import '../../core/constants/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var token;
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: Duration(
          seconds: 3),
      backgroundColor: Colors.white,
      onInit: () {
        token=CacheHelper.getData(key: "token");
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(width: 200.w,
        height: 200.h,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72.w,
                height: 72.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/logo.png",),
                        fit: BoxFit.cover)
                ),
                child: ImageIcon(AssetImage(
                    "assets/images/shopping-bag.png"),
                  color: Colors.white, size: 40.sp,),
              ),
              SizedBox(height: 20.h,),
              Text("Zalada", style: Styles.style28,)
            ],
          ),
        ),
      ),

      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen:token!=null?HomePage()
          :OnBoardingScreen(),
    );
  }
}
