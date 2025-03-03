import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/payment/presentation/view/widgets/add_payment_sheet.dart';
import 'package:odcorange/features/payment/presentation/view/widgets/payment_method.dart';

class PaymentMethodScreen1 extends StatelessWidget {
   PaymentMethodScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentMethod(title: "MasterCard", image: "assets/images/mastercard.png",
              subtitle: "**** **** 0783 7873"),
          PaymentMethod(title: "Paypal", image: "assets/images/paypal.png",
              subtitle: "**** **** 0582 4672"),
          SizedBox(height: 24.h,),
          Text(
            '    Add Another Method',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF292A2D),
              fontSize: 18.sp,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
          SizedBox(height: 16.h,),
          PaymentMethod(title: "Paypal", image: "assets/images/card.png",
              subtitle: "**** **** 0582 4672"),
          SizedBox(height: 16.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0,),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.w,color: AppColors.midgrey
                )
            ),
            child: Row(
              children: [
                Image.asset("assets/images/paypal.png",fit: BoxFit.scaleDown,),
                SizedBox(width: 16.w,),
                Text("Paypal",style: Styles.style14.copyWith(
                    color: Colors.black
                ),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,
                  size: 18.sp,
                  color: Colors.black87,)

              ],
            ),

          ),
          SizedBox(height: 16.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0,),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.w,color: AppColors.midgrey
                )
            ),
            child: Row(
              children: [
                Image.asset("assets/images/apple-pay.png",fit: BoxFit.scaleDown,),
                SizedBox(width: 16.w,),
                Text("ApplePay",style: Styles.style14.copyWith(
                    color: Colors.black
                ),),

              ],
            ),

          ),
          SizedBox(height: 24.h,),
          Text(
            '    Pay Later',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF292A2D),
              fontSize: 18.sp,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
          SizedBox(height: 16.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0,),
            // margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.w,color: AppColors.midgrey
                )
            ),
            child: Row(
              children: [
                Image.asset("assets/images/kredivo.png",fit: BoxFit.scaleDown,),
                SizedBox(width: 16.w,),
                Text("kredivo",style: Styles.style14.copyWith(
                    color: Colors.black
                ),),

              ],
            ),

          ),
        ],
      ),
    );
  }
}
