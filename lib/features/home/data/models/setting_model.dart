

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/features/address/presentation/screens/select_address.dart';

class SettingModel{
  Widget prefix;String title;Widget suffix;

  void Function()?on;
  SettingModel({
    required this.prefix,
    required this.title,required this.suffix,
this.on
});

  static List<SettingModel>settings2=[
  SettingModel(prefix: CircleAvatar(radius: 23.r,
  backgroundColor:  Color(0xFFF3F6FB),
  child: Icon(Icons.people_alt_outlined,
  color: AppColors.primary,),
  )
  , title: "Invite Friends",
  suffix: Icon(Icons.arrow_forward_ios,
    color: AppColors.primary,size: 20.sp,)),
    SettingModel(prefix: CircleAvatar(radius: 23.r,
      backgroundColor:  Color(0xFFF3F6FB),
      child: Icon(Icons.lock_open,
        color: AppColors.primary,),
    )
        , title: "Privacy Policy",
        suffix: Icon(Icons.info_outline,
          color: AppColors.primary,size: 20.sp,)),
    SettingModel(prefix: CircleAvatar(radius: 30.r,
      backgroundColor:  Color(0xFFF3F6FB),
      child: Icon(Icons.info_outline,
        color: Colors.black,),     )         , title: "Payment Method",
        suffix: Icon(Icons.arrow_forward_ios,
          color: Colors.black,size: 20.sp)),
];
}