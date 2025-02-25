import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/home/data/models/notifiation_models.dart';
class NotificationWidget extends StatelessWidget {
  NotificationModel notificationModel;
   NotificationWidget({
    required this.notificationModel
});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.gray,
            child: notificationModel.iconData,
          ),
          SizedBox(width: 14.w,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notificationModel.title,style: Styles.style16black,),
              SizedBox(height: 8.h,),
              Text(notificationModel.subtitle,style: Styles.style14grey,),
            ],
          )
        ],
      ),
    );
  }
}
