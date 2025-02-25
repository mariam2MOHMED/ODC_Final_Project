import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/auth/presentation/view/screens/otp_password.dart';
class ForgetPasswordSheet extends StatelessWidget {
  const ForgetPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: MediaQuery.of(context).size.height*0.42,width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r)
          )
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 8.h,),
          Text("Forget password",style: Styles.style24.copyWith
            (color: AppColors.black),),
          SizedBox(height: 12.h,),
          Text("Select which contact details should we use to\n reset your password",style: Styles.style14grey,),
          SizedBox(height: 24.h,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffF3F6FB),width: 1.w
              ),
              borderRadius: BorderRadius.circular(16.r)
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                    color: Color(0xffF3F6FB)
                  ),
                  child: Icon(Icons.email_rounded,color: AppColors.primary,size: 24.sp,),
                ),
                SizedBox(width: 10.0,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Send via Email",style: Styles.style14grey,),
                    SizedBox(height: 5.0,),
                    Text("bryan.adam83@gmail.com",style: Styles.style16black,),

                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 24.h,),
          CustomBtn(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                OtpPassword()));
          }, txt: "Continue")
        ],
      ),
    );
  }
}
