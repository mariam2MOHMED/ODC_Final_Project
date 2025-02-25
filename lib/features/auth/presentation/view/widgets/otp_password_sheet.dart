import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';

class OtpPasswordSheet extends StatelessWidget {
  const OtpPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
  width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r)
        )
      ),
      child: Column(
        children: [
          SizedBox(height: 8.h,),
          Align(alignment: AlignmentDirectional.center,
            child: Container(
              width: 66.67,
              height: 4,
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.20000000298023224),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Image.asset("assets/images/success.png",width: 243.w,
            height: 220.h,fit: BoxFit.fill,),
          SizedBox(height: 5.h,),
          Text("Congratulations!",style: Styles.style24.copyWith(color: Colors.black),)
          ,SizedBox(height: 10.h,),
          Text("Your account is ready to use.You will be \nredirected to the Homepage in a few seconds.",
            textAlign: TextAlign.center,style: Styles.style14grey,)
       ,  SizedBox(height: 14.h,),
          CustomBtn(onPressed: (){}, txt: "Continue")
      ,  SizedBox(height: 14.h,),
        ],
      ),
    );
  }
}
