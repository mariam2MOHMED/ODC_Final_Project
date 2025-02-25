import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/styles.dart';

import '../constants/App_Colors.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressed;final String txt;
   const CustomBtn({
    required this.onPressed, required this.txt,
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r)
          ),
          fixedSize: Size(MediaQuery.of(context).size.width,
              56.h)
        ),
        onPressed: onPressed,
        child: Center(child:
        Text(txt,style: Styles.style16white,)));
  }
}
