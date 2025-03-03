import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/cart/presentation/screens/no_carts.dart';
import 'package:odcorange/features/cart/presentation/widgets/custom_cart.dart';
import 'package:odcorange/features/wishlist/logic/wish_list_cubit.dart';

import '../widgets/custom_wish_list_product.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishlist(),
      child: BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                  Text("Your Wishlist",style: Styles.style24,),
                  SizedBox(height: 20.0,),
                  context.read<WishListCubit>()
                      .wishlist.length==0?   NoCarts(
                    txt: "Your WishList is Empty",
                    desc: "WishList",
                  )     : GridView.builder(
                    shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                      itemCount: context.read<WishListCubit>()
                          .wishlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 2,
                        childAspectRatio: 12/16,
                        mainAxisSpacing: 20,crossAxisSpacing: 20,),
                      itemBuilder: (context,index){
                        return CustomWishWidget(
                          productModel:context.read<WishListCubit>().
                          wishlist[index]

                        ).animate().fadeIn(
                          duration:
                            Duration(
                              seconds: 1
                            )
                        );
                      }),
                  SizedBox(height: 20.0,),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
