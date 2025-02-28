import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odcorange/core/widets/custom_btn.dart';

class AddPaymentSheet extends StatelessWidget {
  const AddPaymentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: MediaQuery.of(context).size.height*0.65,width: double.infinity,
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
          SizedBox(height: 20.h,),
          Image.asset("assets/images/order.png",
            fit: BoxFit.cover,width: 243.w,
            height: 243.h,),
          SizedBox(height: 24.h,),
          Text(
            'Order Successful!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF292A2D),
              fontSize: 24,
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
          SizedBox(height: 16.h,),
          Text(
            'You have successfully made order',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF7C7D81),
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.43,
            ),
          ),
          SizedBox(height: 24.h,),
          CustomBtn(onPressed: (){

          }, txt: "View Order")
        ],
      ),
    );
  }
}
