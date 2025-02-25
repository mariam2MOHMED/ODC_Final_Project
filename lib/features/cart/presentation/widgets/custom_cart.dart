import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/cart/data/models/product_cart_model.dart';
import 'package:odcorange/features/home/data/models/product_model.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';
import 'package:odcorange/features/home/presentation/screens/product_detials.dart';

class CustomCart extends StatelessWidget {
  ProductCartModel productModel;

  CustomCart({
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context1)=>
        //     BlocProvider.value(
        //       value: BlocProvider.of<HomeCubit>(context)
        //         ..getSingleProduct(productModel.id!),
        //       child: ProductDetials(),
        //     )));

      },
      child: Container(
        width: 159.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.network(productModel.image!,width:118.w ,
              height:85.h ,fit: BoxFit.fill,),
            SizedBox(height: 7.0,),
            Text(productModel.title!,maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Styles.style14w500.copyWith(
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 5.0,),
            Text("\$ ${productModel.price!.toString()}",textAlign: TextAlign.center,
              style: Styles.style16blue.copyWith
                (fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
