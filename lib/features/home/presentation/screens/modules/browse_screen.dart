

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:odcorange/features/home/presentation/widgets/add_filter_sheet.dart';
import 'package:odcorange/features/home/presentation/widgets/custom_product.dart';

import '../../../logic/home_cubit/home_cubit.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 30.h,),
              TextFormField(
                onChanged: (query){
                  context.read<HomeCubit>().getSearch(query);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: AppColors.primary,),
                    hintText: "Search laptop, headset..",
                    hintStyle: TextStyle(
                        color: AppColors.lightgrey
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.w,
                            color: AppColors.lightgrey
                        ),
                        borderRadius: BorderRadius.circular(34.r)
                    )
                ),
              ),
              SizedBox(height: 20.h,),


        context.read<HomeCubit>() .searchs.length==0?Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
                "assets/lottie/Animation - 1739771583890.json",height: 300.h),
         SizedBox(height: 20.h,),
            Text("No Items Found",style: Styles.style24.copyWith(
              color: AppColors.primary
            ),).animate().
            fadeIn(duration: Duration(seconds: 1))
          
          ],
        )):    GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: context.read<HomeCubit>().searchs.length,
                  gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 13/16,
                  crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20),
                  itemBuilder: (context,index){
                return ConditionalBuilder(condition: state is !HomeProductLoading,
                    builder: (context)=>CustomProduct(
                        c: context,
                        productModel: context.read<HomeCubit>().searchs[index]), fallback: (context)=>Center(
                      child: LoadingAnimationWidget.inkDrop(color: AppColors.primary,
                          size: 25.sp),
                    ));
                  }),
              SizedBox(height: 100.h,),


              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r)
                        ),
                        fixedSize: Size(
                            MediaQuery.of(context).size.width*0.3,
                            56.h)
                    ),
                    onPressed: (){
                      showModalBottomSheet(context: context,
                          builder: (context)=>FilterBottomSheet());
                    },
                    child: Center(child:
                    Row(
                      children: [
                        Icon(Icons.filter_alt,color: Colors.white,)
                        ,   Text(" Filter",
                          style: Styles.style16white,),
                      ],
                    ))),
              ),
            ],),

          ),
        );
      },
    );
  }
}
