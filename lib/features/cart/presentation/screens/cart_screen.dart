import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
         :
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
                itemCount: context.read<CartCubit>()
                    .carts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20,),
                itemBuilder: (context,index){
                  return CustomCart(
                 productModel:
                  context.read<CartCubit>().carts[index],
                     );
                }),
          )
        );
      },
    ),
);
  }
}
