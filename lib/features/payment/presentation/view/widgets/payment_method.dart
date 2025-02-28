import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';

class PaymentMethod extends StatelessWidget {
  String image;String title;String subtitle;
   PaymentMethod({
    required this.title,required this.image,required this.subtitle,
});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,color: AppColors.midgrey
        )
      ),
      child: Row(
        children: [
          Image.asset(image,fit: BoxFit.scaleDown,),
          SizedBox(width: 16.w,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: Styles.style14.copyWith(
                color: Colors.black
              ),),
              SizedBox(height: 5.h,),
              Text(subtitle,style: Styles.style14,),

            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios,size: 16.sp,)
        ],
      ),

    );
  }
}
