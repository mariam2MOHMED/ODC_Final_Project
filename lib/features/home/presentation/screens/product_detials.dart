import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/home/data/models/ColorModel.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';
import 'package:readmore/readmore.dart';

import '../widgets/color_widget.dart';

class ProductDetials extends StatefulWidget {
  ProductDetials({super.key});

  @override
  State<ProductDetials> createState() => _ProductDetialsState();
}

class _ProductDetialsState extends State<ProductDetials> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return     BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // var cubit = context.read<HomeCubit>();
    // if (state is HomeSingleProductLoading) {
    //    Center(child: CircularProgressIndicator());
    // } else if (state is HomeSingleProductSucess &&
    //     cubit.productModel != null) {
    //   Scaffold(
    //     backgroundColor: Colors.white,
    //     appBar: AppBar(
    //       actions: [
    //         Container(
    //           decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               border: Border.all(
    //                   color: AppColors.midgrey,
    //                   width: 1.w
    //               )
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(14.0),
    //             child: Icon(Icons.favorite_border,
    //               size: 25.sp,
    //               color: AppColors.black,),
    //           ),
    //         )
    //       ],
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SizedBox(height: 24.h,),
    //           Text(context.read<HomeCubit>().productModel!.title!,
    //             textAlign: TextAlign.center, style: Styles.style24,
    //           ),
    //           SizedBox(height: 8.h,),
    //           Text("\$${context.read<HomeCubit>().productModel!.price!}",
    //             textAlign: TextAlign.center, style: Styles.style20,
    //           ),
    //           SizedBox(height: 12.h,),
    //           Image.network(context.read<HomeCubit>().productModel!.image!, width: 303.w,
    //             height: 200.h, fit: BoxFit.fill,),
    //           SizedBox(height: 12.h,),
    //           Text("Space Grey", style: Styles.style12,),
    //           SizedBox(height: 12.h,),
    //           Container(height: 50.h,
    //             width: double.infinity,
    //             alignment: AlignmentDirectional.center,
    //             child: Align(alignment: AlignmentDirectional.center,
    //               child: ListView.separated(
    //                   padding: EdgeInsets.only(left: 90),
    //                   scrollDirection: Axis.horizontal,
    //                   itemBuilder: (context, index) {
    //                     return colorWidger(
    //                         onTap: () {
    //                           ColorModel.colors[index].isSelected =
    //                           !ColorModel.colors[index].isSelected;
    //                           setState(() {
    //
    //                           });
    //                         },
    //                         colorModel:
    //                         ColorModel.colors[index]);
    //                   },
    //                   separatorBuilder: (context, index) {
    //                     return SizedBox(width: 16.w,);
    //                   },
    //                   itemCount: ColorModel.colors.length),
    //             ),
    //           ),
    //           Divider(
    //             thickness: 6, color: AppColors.midgrey, height: 24.h,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text("Product Description", style: Styles.style18,),
    //                 SizedBox(height: 20.h,),
    //                 ReadMoreText(
    //                   context.read<HomeCubit>().productModel!.description!,
    //                   trimMode: TrimMode.Line,
    //                   trimLines: 2,
    //                   preDataTextStyle: Styles.style14grey,
    //                   postDataTextStyle: Styles.style14grey,
    //                   colorClickableText: AppColors.blue,
    //                   style: Styles.style14grey,
    //                   trimCollapsedText: 'Read more',
    //                   trimExpandedText: 'Read less',
    //                   lessStyle: Styles.style14grey.copyWith(
    //                       color: AppColors.blue
    //                   ), moreStyle: Styles.style14grey.copyWith(
    //                     color: AppColors.blue
    //                 ),
    //                 ),
    //                 SizedBox(height: 12.h,),
    //                 Row(
    //                   children: [
    //                     Container(
    //                       decoration: BoxDecoration(
    //                           shape: BoxShape.circle,
    //                           border: Border.all(
    //                               color: AppColors.midgrey,
    //                               width: 1.w
    //                           )
    //                       ),
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(14.0),
    //                         child: Icon(Icons.add_shopping_cart,
    //                           size: 25.sp,
    //                           color: AppColors.black,),
    //                       ),
    //                     ),
    //                     SizedBox(width: 24.0,),
    //                     Expanded(child: CustomBtn(
    //                         onPressed: () {}, txt: "Checkout"))
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //
    //           // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           //   children: [
    //           //
    //           //   // GestureDetector(
    //           //   //   onTap: (){
    //           //   //     isSelected=true;
    //           //   //     setState(() {
    //           //   //
    //           //   //     });
    //           //   //   },
    //           //   //   child: Container(
    //           //   //     width: 40.w,
    //           //   //     height: 40.h,
    //           //   //     decoration: BoxDecoration(
    //           //   //       shape: BoxShape.circle,
    //           //   //       color: Colors.transparent,
    //           //   //      border: Border.all(
    //           //   //        width: 5,color:isSelected==true?
    //           //   //      Color(0xFFA6A5AA):Colors.transparent
    //           //   //      )
    //           //   //     ),
    //           //   //     child: Container(
    //           //   //     width: 32.w,
    //           //   //     height: 32.h,
    //           //   //     decoration: ShapeDecoration(
    //           //   //       color: Color(0xFFA6A5AA),
    //           //   //       shape: OvalBorder(
    //           //   //         side: BorderSide(
    //           //   //           width: 3,
    //           //   //           strokeAlign: BorderSide.strokeAlignCenter,
    //           //   //           color: Colors.white,
    //           //   //         ),
    //           //   //       ),)),
    //           //   //   ),
    //           //   // ),
    //           //   //
    //           //   //   Container(
    //           //   //       width: 32.w,
    //           //   //       height: 32.h,
    //           //   //       decoration: ShapeDecoration(
    //           //   //         color:Color(0xFFE8E8EA),
    //           //   //         shape: OvalBorder(
    //           //   //           side: BorderSide(
    //           //   //             width: 3,
    //           //   //             strokeAlign: BorderSide.strokeAlignCenter,
    //           //   //             color: Colors.white,
    //           //   //           ),
    //           //   //         ),)),
    //           //   //   Container(
    //           //   //       width: 32.w,
    //           //   //       height: 32.h,
    //           //   //       decoration: ShapeDecoration(
    //           //   //         color:Color(0xFFF2E0CC),
    //           //   //         shape: OvalBorder(
    //           //   //           side: BorderSide(
    //           //   //             width: 3,
    //           //   //             strokeAlign: BorderSide.strokeAlignCenter,
    //           //   //             color: Colors.white,
    //           //   //           ),
    //           //   //         ),)),
    //           //   ],
    //           // )
    //         ],
    //       ),
    //     ),
    //   );
    // } else {
    //    Center(child: Text("Failed to load product"));
    // }
  },
  builder: (context, state) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.midgrey,
                      width: 1.w
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Icon(Icons.favorite_border,
                  size: 25.sp,
                  color: AppColors.black,),
              ),
            )
          ],
        ),
        body:ConditionalBuilder(condition: context.read<HomeCubit>().
        productModel!=null,
            builder: (BuildContext context)=> SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Text(context.read<HomeCubit>().productModel!.title!,
                    textAlign: TextAlign.center, style: Styles.style24,
                  ),
                  SizedBox(height: 8.h,),
                  Text("\$${context.read<HomeCubit>().productModel!.price!}",
                    textAlign: TextAlign.center, style: Styles.style20,
                  ),
                  SizedBox(height: 12.h,),
                  Image.network(context.read<HomeCubit>().productModel!.image!, width: 303.w,
                    height: 200.h, fit: BoxFit.fill,),
                  SizedBox(height: 12.h,),
                  Text("Space Grey", style: Styles.style12,),
                  SizedBox(height: 12.h,),
                  Container(height: 50.h,
                    width: double.infinity,
                    alignment: AlignmentDirectional.center,
                    child: Align(alignment: AlignmentDirectional.center,
                      child: ListView.separated(
                          padding: EdgeInsets.only(left: 90),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return colorWidger(
                                onTap: () {
                                  ColorModel.colors[index].isSelected =
                                  !ColorModel.colors[index].isSelected;
                                  setState(() {

                                  });
                                },
                                colorModel:
                                ColorModel.colors[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 16.w,);
                          },
                          itemCount: ColorModel.colors.length),
                    ),
                  ),
                  Divider(
                    thickness: 6, color: AppColors.midgrey, height: 24.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Description", style: Styles.style18,),
                        SizedBox(height: 20.h,),
                        ReadMoreText(
                          context.read<HomeCubit>().productModel!.description!,
                          trimMode: TrimMode.Line,
                          trimLines: 2,
                          preDataTextStyle: Styles.style14grey,
                          postDataTextStyle: Styles.style14grey,
                          colorClickableText: AppColors.blue,
                          style: Styles.style14grey,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Read less',
                          lessStyle: Styles.style14grey.copyWith(
                              color: AppColors.blue
                          ), moreStyle: Styles.style14grey.copyWith(
                            color: AppColors.blue
                        ),
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.midgrey,
                                      width: 1.w
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Icon(Icons.add_shopping_cart,
                                  size: 25.sp,
                                  color: AppColors.black,),
                              ),
                            ),
                            SizedBox(width: 24.0,),
                            Expanded(child: CustomBtn(
                                onPressed: () {}, txt: "Checkout"))
                          ],
                        )
                      ],
                    ),
                  ),

                  // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //
                  //   // GestureDetector(
                  //   //   onTap: (){
                  //   //     isSelected=true;
                  //   //     setState(() {
                  //   //
                  //   //     });
                  //   //   },
                  //   //   child: Container(
                  //   //     width: 40.w,
                  //   //     height: 40.h,
                  //   //     decoration: BoxDecoration(
                  //   //       shape: BoxShape.circle,
                  //   //       color: Colors.transparent,
                  //   //      border: Border.all(
                  //   //        width: 5,color:isSelected==true?
                  //   //      Color(0xFFA6A5AA):Colors.transparent
                  //   //      )
                  //   //     ),
                  //   //     child: Container(
                  //   //     width: 32.w,
                  //   //     height: 32.h,
                  //   //     decoration: ShapeDecoration(
                  //   //       color: Color(0xFFA6A5AA),
                  //   //       shape: OvalBorder(
                  //   //         side: BorderSide(
                  //   //           width: 3,
                  //   //           strokeAlign: BorderSide.strokeAlignCenter,
                  //   //           color: Colors.white,
                  //   //         ),
                  //   //       ),)),
                  //   //   ),
                  //   // ),
                  //   //
                  //   //   Container(
                  //   //       width: 32.w,
                  //   //       height: 32.h,
                  //   //       decoration: ShapeDecoration(
                  //   //         color:Color(0xFFE8E8EA),
                  //   //         shape: OvalBorder(
                  //   //           side: BorderSide(
                  //   //             width: 3,
                  //   //             strokeAlign: BorderSide.strokeAlignCenter,
                  //   //             color: Colors.white,
                  //   //           ),
                  //   //         ),)),
                  //   //   Container(
                  //   //       width: 32.w,
                  //   //       height: 32.h,
                  //   //       decoration: ShapeDecoration(
                  //   //         color:Color(0xFFF2E0CC),
                  //   //         shape: OvalBorder(
                  //   //           side: BorderSide(
                  //   //             width: 3,
                  //   //             strokeAlign: BorderSide.strokeAlignCenter,
                  //   //             color: Colors.white,
                  //   //           ),
                  //   //         ),)),
                  //   ],
                  // )
                ],
              ),
            ) ,
            fallback:  (context)=> Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: AppColors.primary, size: 40.sp),
            ))

      );
     ;
  },
);
  }
}
