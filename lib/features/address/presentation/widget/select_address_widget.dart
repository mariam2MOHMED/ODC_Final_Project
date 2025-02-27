import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';

class SelectAddressWidget extends StatelessWidget {
  String image;String title;bool isOrange;
   SelectAddressWidget({
    required this.image,    required this.title,
this.isOrange=false
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.w,color:Color(0xffEAEAEA)
        )
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26.r,
                backgroundColor: Color(0xffF3F6FB),
                child: Image.asset(image,height: 27.0,fit: BoxFit.cover,),
              ),
              SizedBox(width: 7.w,),
              Text(title,style: Styles.style14.copyWith(
                color: isOrange==true? Color(0xFFFF9C44):Color(0xFF292A2E),
              ),)
            ],
          ),
          SizedBox(height: 19.h,),
          Row(
            children: [
             Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Jl. Pangkur, Ngaglik, Sleman,\n Yogyakarta",style:
                 TextStyle(
                   color: Color(0xFF292A2E),
                   fontSize: 14.sp,
                   fontFamily: 'Plus Jakarta Sans',
                   fontWeight: FontWeight.w600,
                 ),),
                 SizedBox(height: 8.h,),
                 Text("+62812 788 61 1672",style:
                 TextStyle(
                  
                   fontSize: 14.sp,
                   color: Color(0xFF292A2E),
                   fontWeight: FontWeight.w400,
                   fontFamily: GoogleFonts.plusJakartaSans().fontFamily,

                 ),),
               ],
             ),
              Spacer(),
              CircleAvatar(
                radius: 35.r,
                backgroundImage:
                AssetImage("assets/images/Map.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
