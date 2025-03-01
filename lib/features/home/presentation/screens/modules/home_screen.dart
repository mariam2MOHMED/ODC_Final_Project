import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';
import 'package:odcorange/features/home/presentation/screens/notifications_screen.dart';
import 'package:odcorange/features/home/presentation/widgets/custom_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return
        SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 300.h,
                    decoration:  BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffFBCCDC),
                          // blurRadius: 4.0,spreadRadius: 12,
                          offset: Offset(4, 0),
                        )
                      ],
                      gradient: LinearGradient(
                          colors: [Color(0xffFDA56C),Color(0xffFDA56C).withOpacity(0.6),Color(0xFFFD6C8A),Color(0xFFFD6C8A),
                            Color(0xFFFFBCCDC)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            CircleAvatar(radius: 24.r,
                              backgroundColor:AppColors.
                              lightwhite,
                              child: Icon(Icons.
                              location_on,color: Colors.white,),
                            ),
                            SizedBox(width: 12.w,),
                            Column(crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Text("Location",style: Styles.style12White,),
                                SizedBox(height: 10.h,),
                                Text("Condong Catur",style: Styles.style14white,),
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(radius: 24.r,
                              backgroundColor: Colors.white.withOpacity(0.20000000298023224),
                              child: Transform.rotate(
                                  angle: 25,
                                  child: GestureDetector(
                                      onTap: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
                                      },
                                      child: Icon(Icons.notifications,color: Colors.white,))),
                            ),
                            SizedBox(width: 7.w,),
                            CircleAvatar(radius: 24.r,
                              backgroundImage: AssetImage("assets/images/Profile.png"),

                            ),
                          ],
                        ),
                        SizedBox(height: 30.h,),
                        Text("Find best device for\n your setup!",style: Styles
                            .style32.copyWith(color: Colors.white),)
                        ,SizedBox(height: 20.h,),


                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(     width: 335.w,
                              height: 190.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  image: DecorationImage(image:
                                  AssetImage("assets/images/Background.png"),fit: BoxFit.fill)
                              ),),
                            Positioned(top: -35.h,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  children: [
                                    Column(crossAxisAlignment:CrossAxisAlignment.start ,
                                      children: [
                                        SizedBox(height: 50.h,),
                                        Text("New Bing\n Wireless\n Earphone",
                                          style: Styles.style28.copyWith(color: Colors.white),),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          children: [
                                            Text("See Offer ",style: Styles.style16.copyWith(color: Colors.white),),
                                            ImageIcon(AssetImage
                                              ("assets/images/halfarrow.png"),
                                              color: Colors.white,)
                                          ],
                                        ),],
                                    ),
                                    SizedBox(width: 25.w,),
                                    // ImageIcon(AssetImage
                                    //   ("assets/images/hear.png"),
                                    //   color: Colors.white,)
                                    Image.asset(// i want to make this image outside container
                                      "assets/images/hear.png",
                                      fit: BoxFit.fill,height: 200.h,)
                                    //    Positioned(
                                    //        top: 50.0,
                                    //        child: Image.asset(
                                    // "assets/images/hear.png"))

                                  ],
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ],
                ),
                //
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Hot deals🔥",style: Styles.style18,),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.darkwhite,
                                borderRadius: BorderRadius.circular(4.r)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("02",style: Styles.style12.
                              copyWith(color: AppColors.black,fontWeight: FontWeight.bold),),
                            ),
                          ),
                          SizedBox(width: 1.5,),
                          ImageIcon(AssetImage("assets/images/dot.png"),color: AppColors.black,)
                          ,SizedBox(width: 1.5,),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.darkwhite,
                                borderRadius: BorderRadius.circular(4.r)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("12",style: Styles.style12.
                              copyWith(color: AppColors.black,fontWeight: FontWeight.bold),),
                            ),
                          ),
                          SizedBox(width: 1.5,),
                          ImageIcon(AssetImage("assets/images/dot.png"),color: AppColors.black,)
                          ,SizedBox(width: 1.5,),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.darkwhite,
                                borderRadius: BorderRadius.circular(4.r)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("00",style: Styles.style12.
                              copyWith(color: AppColors.black,fontWeight: FontWeight.bold),),
                            ),
                          ),


                        ],
                      ),
                      SizedBox(height: 16.h,),
                      SizedBox(       height: 221.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return ConditionalBuilder(condition: state is !HomeProductLoading,
                                  builder: (context)=>CustomProduct(
 c: context,
 productModel: context.read<HomeCubit>().
         products[index],
                                  ),
                                  fallback: (context)=>Center(
                                    child: Center(
                                      child: LoadingAnimationWidget.inkDrop
                                        (color: AppColors.pink, size: 30.sp),
                                    ),
                                  ));
                                ;
                            },
                            separatorBuilder: (context,index){
                              return SizedBox(width: 20.w,);
                            },
                            itemCount: context.read<HomeCubit>().products.length),
                      ),
                      SizedBox(height: 10.h,),
                      Text("Categories",style: Styles.style18,),
                      SizedBox(height: 10.h,),
                      SizedBox(  height: 50.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return ConditionalBuilder(
                                  condition: state is !HomeCategoriesLoading,
                                  builder: (context){
                                    if(context.read<HomeCubit>().cats[index]=="All"){
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                            BorderRadius.circular(30.r),
                                            border: Border.all(
                                                width: 1.w,
                                                color: AppColors.primary
                                            )
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: 8.w,vertical: 7.h
                                          ),
                                          child: Row(
                                            children: [

                                              CircleAvatar(
                                                radius: 17.r,
                                                backgroundColor: Colors.white,
                                                child:  Icon(Icons.
                                                grid_view_rounded,
                                                  color: AppColors.primary,size: 15.sp,) ,
                                              ),
                                              SizedBox(width: 4.w,),
                                              Text(context.read<HomeCubit>().cats[0],
                                                style: Styles.style14.copyWith(
                                                  color: Colors.white
                                                ),),
                                            ],
                                          ),
                                        ),
                                      );
                                    }else{
                                      return
                                        Container(
                                        decoration: BoxDecoration(color: Colors.white,
                                          borderRadius: BorderRadius.circular(30.r),
                                          border: Border.all(
                                            width: 1.w,color: AppColors.lightgrey
                                          )
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(
                                            horizontal: 10.w,vertical: 14.h
                                          ),
                                          child: Center(
                                            child: Text(context.read<HomeCubit>().cats[index],
                                              style: Styles.style14.copyWith(
                                                fontWeight: FontWeight.w500,
                                                  color: Colors.black
                                              ),),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  fallback: (context)=>Center(
                                    child: LoadingAnimationWidget.inkDrop
                                      (color: AppColors.pink, size: 30.sp),
                                  ));
                              ;
                            },
                            separatorBuilder: (context,index){
                              return SizedBox(width: 20.w,);
                            },
                            itemCount: context.read<HomeCubit>().cats.length),
                      ),
                      SizedBox(height: 10.h,),
                      GridView.builder(

                        shrinkWrap: true,

                        physics:   NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,mainAxisSpacing: 20,
childAspectRatio: 13/16,
                            crossAxisSpacing: 20),
                          itemBuilder: (context,index){
                            return ConditionalBuilder(
                                condition: state is !HomeProductLoading,
                                builder: (context)=>
                                    CustomProduct(
                                  c: context,
                                  productModel: context.read<HomeCubit>().
                                  products[index],
                                ),
                                fallback: (context)=>Center(
                                  child: Center(
                                    child: LoadingAnimationWidget.inkDrop
                                      (color: AppColors.pink, size: 30.sp),
                                  ),
                                ));
                          },

                        itemCount:
                      context.read<HomeCubit>().products.length,)
                    ],
                  ),
                )
              ],
            ),
          )

     ;
    },
    );
  }
}
