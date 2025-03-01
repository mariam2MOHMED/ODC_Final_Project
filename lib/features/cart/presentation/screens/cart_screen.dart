import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:odcorange/features/cart/presentation/widgets/custom_cart.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';

import 'no_carts.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CartCubit()..getCart(),
  child: BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            titleTextStyle:TextStyle(
              fontSize: 18.sp,color: Colors.black
            ) ,
            title: Text("Cart"),
          ),
          body:context.read<CartCubit>().carts.length==0?
          NoCarts(
            txt: "Your Cart is Empty",
            desc: "Cart",
          )
         :ConditionalBuilder(condition: state is !CartLoading,
              builder: (context)=> Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                    itemCount: context.read<CartCubit>()
                        .carts.length,

                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
childAspectRatio: 13/16,
                      crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20,),
                    itemBuilder: (context,index){
                      return Container(
                        child: CustomCart(
                          productModel:
                          context.read<CartCubit>().
 carts[index],
                        ),
                      ).animate().fadeIn(
                        duration: Duration(seconds: 1)
                      );
                    }),
              ), fallback: (context)=>LoadingAnimationWidget.
              inkDrop(color: AppColors.primary, size: 40.sp) )

        );
      },
    ),
);
  }
}
