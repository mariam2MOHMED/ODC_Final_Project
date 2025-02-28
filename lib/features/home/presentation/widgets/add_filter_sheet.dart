import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';

class FilterBottomSheet extends StatefulWidget {
   FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
double inital=160;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: MediaQuery.of(context).size.height*0.35,width: double.infinity,
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
    SizedBox(height: 20.h,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Filter",style: Styles.style18,),
        Text("Reset",style: Styles.style14.copyWith(
          color: AppColors.blue
        ),),
      ],
    ),

    SizedBox(height: 12.h,),
    Divider(thickness: 1,height: 24,color: AppColors.midgrey,),
    SizedBox(height: 12.h,),
    Text("Price Range",style: Styles.style18,),
    SizedBox(height: 20.h,),
    Slider(
     onChangeStart:(init){
       init=160.0;
       setState(() {

       });
     },
        onChangeEnd:(end){
       end=1960;
       setState(() {

       });
        },
        activeColor: Color(0xFFFF9C44),
        inactiveColor:  Color(0xFFF1F1F1),
        min: 0,value: inital, max: 2300,
        secondaryActiveColor: Colors.white,
        onChanged: (value){
      inital=value;setState(() {

      });
        }),
    SizedBox(height: 20.h,),
    CustomBtn(onPressed: (){}, txt: "Apply Filter")
  ],
),
    );
  }
}
