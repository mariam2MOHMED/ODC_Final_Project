import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/address/presentation/screens/select_address.dart';
import 'package:odcorange/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:odcorange/features/home/data/models/setting_model.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';
import 'package:odcorange/features/home/presentation/screens/edit_profile.dart';
import 'package:odcorange/features/home/presentation/widgets/setting_widget.dart';
import 'package:odcorange/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    List<SettingModel>settings1=[
      SettingModel(

          prefix: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectAddressScreen()));
            },
            child: CircleAvatar(radius: 23.r,
              backgroundColor:  Color(0xFFF3F6FB),
              child: Icon(Icons.location_on_outlined,
                color: AppColors.primary,),
            ),
          )
          , title: "Address",
          suffix: Icon(Icons.arrow_forward_ios,color: AppColors.primary,)),

      SettingModel(prefix: CircleAvatar(radius: 23.r,
        backgroundColor:  Color(0xFFF3F6FB),
        child: Icon(Icons.payment_rounded,
          color: AppColors.primary,),
      )
          , title: "Payment Method",
          suffix: Icon(Icons.arrow_forward_ios,color: AppColors.primary,)),
      SettingModel(prefix: GestureDetector(
        onTap: (){

        },
        child: CircleAvatar(radius: 23.r,
          backgroundColor:  Color(0xFFF3F6FB),
          child: Transform.rotate(angle: 25.0,
            child: Icon(Icons.notifications_none,
              color:AppColors.primary,),
          ),
        ),
      )
          , title: "Notifications",
          suffix:Switch(
              activeColor: Colors.green,
              value:true , onChanged: (r){

          }

          )
      ),
      SettingModel(prefix: CircleAvatar(radius: 23.r,
        backgroundColor:  Color(0xFFF3F6FB),
        child: Icon(Icons.security,
          color: AppColors.primary,),
      )
          ,title: "Account Security",
          suffix: Icon(Icons.arrow_forward_ios,
            color: AppColors.primary,)),
    ];
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Profile"),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => EditProfile()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.midgrey,
                          width: 1.w)),
                  child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: ImageIcon(
                          AssetImage
                            ("assets/images/Icon.png"))),
                ),
              ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 14.h,
                ),
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage:
                  AssetImage(
                      "assets/images/person.png"),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  context
                      .read<HomeCubit>()
                      .name
                      ??
                "Mariam",
                  style: Styles.style18,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  context
                      .read<HomeCubit>().email??
                 "mariam@gmail.com",
                  style: Styles.style14grey,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        thickness: 6,
                        color: Color(0xFFF0F1F5),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        "   Account Settings",
                        style: Styles.style14grey,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: settings1.length,
                          itemBuilder: (context, index) {
                            return SettingWidget(
                                settingModel:

                                settings1[index]);
                          }),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        "   General",
                        style: Styles.style14grey,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: SettingModel.settings2.length,
                          itemBuilder: (context, index) {
                            return SettingWidget(
                                settingModel:
                                SettingModel.settings2[index]);
                          }),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        thickness: 6,
                        color: Color(0xFFF0F1F5),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OnBoardingScreen()),
                                      (route) => false);
                            },
                            child: CircleAvatar(
                              radius: 23.r,
                              backgroundColor: Color(0xFFF3F6FB),
                              child: Icon(
                                Icons.logout_sharp,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            "Log out",
                            style: Styles.style16
                                .copyWith(color: AppColors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

