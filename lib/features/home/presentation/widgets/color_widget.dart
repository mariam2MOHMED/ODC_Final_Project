import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/home/data/models/ColorModel.dart';
class colorWidger extends StatelessWidget {
  ColorModel colorModel;Function() onTap;
   colorWidger({
    required this.colorModel, required this.onTap,
   });

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 44.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
                width: 3.w,color:colorModel.isSelected==true?
            colorModel. color:Colors.white
            )
        ),
        child: Center(
          child: CircleAvatar(
            radius: 16.r,
            backgroundColor:  colorModel.color,

          ),
        ),
      ),
    );
  }
}
