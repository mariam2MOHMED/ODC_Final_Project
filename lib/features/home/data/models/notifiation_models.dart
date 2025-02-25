import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
class NotificationModel{
  Widget iconData;String title;String subtitle;

  NotificationModel({required this.iconData,required this.title,required
  this.subtitle});
  static List<NotificationModel>notifcations=[

    NotificationModel(iconData: ImageIcon(AssetImage
      ("assets/images/discount_icon.png"),size: 40.sp,
      color: AppColors.red,),
        title: "Special Offer! 40% Off", subtitle:
        "Special offer for new account, valid \nuntil 20 Nov 2022"),
    NotificationModel(iconData: ImageIcon(AssetImage
      ("assets/images/discount_icon.png"),size: 40.sp,
      color: AppColors.red,),
        title: "Special Offer! 50% Off", subtitle:
        "Special offer for new account, valid \nuntil 20 Nov 2022"),
    NotificationModel(iconData: Icon(
      Icons.payment_sharp,color: AppColors.orange,size: 30.sp),
        title: "Credit Card Connected", subtitle:
        "Special promotion only valid today"),
    NotificationModel(iconData: Icon(Icons.person,
      color: AppColors.black,size: 30.sp,),
        title: "Account Setup Successfull!", subtitle:
        "Special promotion only valid today"),
  ];
}