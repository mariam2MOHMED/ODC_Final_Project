import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odcorange/core/db/local_db/local_db.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/home/data/models/ColorModel.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';
import 'package:odcorange/features/cart/presentation/screens/order_screen.dart';
import 'package:readmore/readmore.dart';

import '../widgets/color_widget.dart';

class ProductDetials extends StatefulWidget {
  ProductDetials({super.key});

  @override
  State<ProductDetials> createState() => _ProductDetialsState();
}

class _ProductDetialsState extends State<ProductDetials> {
  bool isSelected = false;bool isFav=false;

  @override
  Widget build(BuildContext context) {
    return     BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {

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
                child: GestureDetector(
                  onTap: ()async{

    try{
    await SQLHelper.
    add(context.read<HomeCubit>().productModel!.id!.toString()??"",
    context.read<HomeCubit>().productModel!.title!??"",
    context.read<HomeCubit>().productModel!.description!??"",
    context.read<HomeCubit>().productModel!.image!??"", 4,
    context.read<HomeCubit>().productModel!.price!.toDouble(),
        "wishlist");
    }catch(e){
    print("the error at wishlist is ${e}");
    }
    isFav=!isFav;
    setState(() {

    });
                  },
                  child: Icon(isFav==true?Icons.favorite:Icons.favorite_border,
                    size: 25.sp,
                    color:isFav?AppColors.red: AppColors.black,),
                ),
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
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(context.read<HomeCubit>().productModel!.title!,
                style: Styles.style24,
                    ),
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
                                child: GestureDetector(
                                  onTap: ()async{

                                    try{
                                      await SQLHelper.
                                      add(context.read<HomeCubit>().productModel!.id!.toString()??"",
                                          context.read<HomeCubit>().productModel!.title!??"",
                                          context.read<HomeCubit>().productModel!.description!??"",
                                          context.read<HomeCubit>().productModel!.image!??"", 5,
                                          context.read<HomeCubit>().productModel!.price!.toDouble(),
                                  "cart"    );
                                    }catch(e){
                                      print("the error at cart is ${e}");
                                    }
                                  },
                                  child: Icon(Icons.add_shopping_cart,
                                    size: 25.sp,
                                    color: AppColors.black,),
                                ),
                              ),
                            ),
                            SizedBox(width: 24.0,),
                            Expanded(child: CustomBtn(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder:
                                      (context)=>
                               CartOrderScreen()));
                                }, txt: "Checkout"))
                          ],
                        )
                      ],
                    ),
                  ),

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
