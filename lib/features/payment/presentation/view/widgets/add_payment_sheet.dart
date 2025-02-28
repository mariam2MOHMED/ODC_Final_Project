import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/payment/presentation/view/screen/add_new_card.dart';

class AddPaymentSheet extends StatelessWidget {
  const AddPaymentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: MediaQuery.of(context).size.height*0.46,width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r)
          )
      ),child: Column(
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
        Text("Add New Payment Method",style: Styles.style18,),
        SizedBox(height: 10.h,),
      Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.w,color: AppColors.midgrey
            )
        ),
        child: Row(
          children: [
            Icon(Icons.payment_sharp,size: 20.sp,),
            SizedBox(width: 16.w,),
            Text("Credit or Debit Card",style: Styles.style14.copyWith(
                color: Colors.black
            ),),
            Spacer(),
            Icon(Icons.check_circle,size: 18.sp,color: AppColors.orange,)
          ],
        ),

      ),
        SizedBox(height: 10.h,),
      Container(
       // margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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

          ],
        ),

      ),
        SizedBox(height: 10.h,),
        Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
              Text("Paypal",style: Styles.style14.copyWith(
                  color: Colors.black
              ),),

            ],
          ),

        ),
        SizedBox(height: 16.h,),
        CustomBtn(onPressed: (){
          Navigator.push(context, MaterialPageRoute
            (builder: (context)=>AddNewCard()));
        }, txt: "Continue"),
        SizedBox(height: 16.h,),
      ],
    ),
    );
  }
}
