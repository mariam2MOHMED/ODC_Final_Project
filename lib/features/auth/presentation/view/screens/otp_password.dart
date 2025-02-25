import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/auth/presentation/view/widgets/otp_password_sheet.dart';

import '../../../../../core/widets/custom_btn.dart';

class OtpPassword extends StatelessWidget {
  const OtpPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("OTP"),centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,fontWeight: FontWeight.w600,
          fontSize: 18.sp
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40.h,),
          Image.asset("assets/images/OTP.png",height:243.h ,width:243.w ,fit: BoxFit.fill,),
         SizedBox(height: 20.h,),
          Text("Verification code",style: Styles.style24.copyWith(
            color: Colors.black
          ),),
          SizedBox(height: 10.h,),
          Text("We have sent the code verification to you\n WhatsApp Number ",style:
          Styles.style14,),
      SizedBox(height: 20.h,),
          OtpTextField(
            numberOfFields: 5,
            borderColor: AppColors.primary,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            }, // end onSubmit
          ),
          SizedBox(height: 20.h,),
          Text("Recent code in 32s",style: Styles.style16.copyWith(
              color: Colors.black
          ),),
          SizedBox(height: 50.h,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomBtn(onPressed: (){
              showModalBottomSheet(context: context, builder: (context)=>OtpPasswordSheet());
            }, txt: "Continue"),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    )

    ;
  }
}

