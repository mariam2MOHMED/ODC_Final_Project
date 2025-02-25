import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/auth/presentation/view/screens/login_screen.dart';
import 'package:odcorange/features/on_boarding/models/on_boarding_model.dart';
class OnBoardingWidget extends StatefulWidget {
  OnBoardingModel onBoardingModel;PageController  controller;
int index;
   OnBoardingWidget({
    required this.onBoardingModel,
     required this.controller,
     required this.index,
});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}
class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
Image.asset(widget.onBoardingModel.image,width: 300.w,
  height: 300.h,
  fit: BoxFit.cover,),
        SizedBox(height:24.h ,),
        Text(widget.onBoardingModel.title,style: Styles.style28,
          textAlign: TextAlign.center,),
        SizedBox(height:16.h ,),
        Text(widget.onBoardingModel.
        subtitle,style: Styles.style14,textAlign: TextAlign.center,),
        SizedBox(height:24.h ,),
        Stack(
          children: [
            // Outer Container (for the border effect)
            Container(
              width: 115.w, // Set width to 100
              height: 115.h, // Set height to 100
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                gradient: LinearGradient(
                  colors: [ widget.onBoardingModel==
                      OnBoardingModel.boards[1]?
                  AppColors.primary:Colors.grey.shade200 ,
                    widget.onBoardingModel==
                        OnBoardingModel.boards[1]?
                    Colors.grey.shade200:AppColors.primary
                    ],
                  stops: [widget.onBoardingModel.start,
                    widget.onBoardingModel.end],
                  begin:widget.onBoardingModel==
                      OnBoardingModel.boards[1]?
                  Alignment.bottomCenter:Alignment.centerLeft,
                   end: widget.onBoardingModel==
                       OnBoardingModel.boards[1]?
                   Alignment.centerLeft:Alignment.centerRight,
                ),
              ),
            ),
            // Inner Container (to create the border effect)
            Positioned(
              top: 5, // Adjust for border thickness
              left: 5, // Adjust for border thickness
              child: Container(
                width: 105.w, // Adjust for border thickness (100 - 2 * 5)
                height: 105.h, // Adjust for border thickness (100 - 2 * 5)

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: (){
                    if(widget.index==3){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }
                    else{
                     widget.index++;
                      widget.controller.
                      nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut,);
                    }

                  },
                  child: Center(
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.arrow_forward,
                        color: Colors.white,size: 25.sp,),
                    ),
                  ),
                ),// Inner color of the container
              ),

            ),
          ],
        ),
      ],
    );
  }
}
