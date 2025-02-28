import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/home/data/models/notifiation_models.dart';
import 'package:odcorange/features/home/presentation/widgets/notification_widget.dart';
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
    //     title:
    //     Container(
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         border: Border.all(
    //           color: AppColors.midgrey,
    //             width: 1.w
    //         )
    //       ),
    // child: Padding(
    //   padding: const EdgeInsets.all(14.0),
    //   child: Icon(Icons.arrow_back_sharp,color: AppColors.black,),
    // ),
    //     ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Notification",style: Styles.style24,),
            SizedBox(height: 12.h,),
            Text("Today",style: Styles.style14w500.copyWith(color: Color(0xFF7C7D81)),),
            NotificationWidget(notificationModel: NotificationModel(
                iconData: ImageIcon(AssetImage
                  ("assets/images/discount_icon.png"),size: 40.sp,
                  color: AppColors.red,),
                title: "30% Special Discount!", subtitle: "Special promotion only valid today"
            ),)
          , Divider(
              color: AppColors.midgrey,thickness: 1,
            ),
            NotificationWidget(
              notificationModel: NotificationModel(
                  iconData: Icon(Icons.apple,size: 32.sp,
                    color: AppColors.black,),
                  title: "New Apple Promotion", subtitle: "Special promotion to all apple devices"
              ),
            )
            , Divider(
              color: AppColors.midgrey,thickness: 4,
            ),
            SizedBox(height: 16.h,),
            Text("Yesterday",
              style: Styles.style14w500.copyWith(color: Color(0xFF7C7D81)),),
            Expanded(
              child: ListView.separated(itemBuilder: (context,index){
                return NotificationWidget(notificationModel: NotificationModel.notifcations[index]);
              }
                  , separatorBuilder: (context,index){
                return Divider(thickness: 1.0,color: AppColors.midgrey,);
                  }, itemCount: NotificationModel.notifcations.length),
            )
          ],
        ),
      ),
    );
  }
}
