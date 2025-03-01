import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/cart/logic/cart_cubit/cart_cubit.dart';

import '../../../payment/presentation/view/widgets/add_sucessful_payment_sheet.dart';

class CartOrderScreen extends StatelessWidget {
  const CartOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..
      getCart(),
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
                title: Text("Order"),
              ),
              body:SingleChildScrollView(
                child: Column(
                  children: [
                SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 16.0
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Address",style: Styles.style18,),
                              Text("Edit",style: Styles.style14.copyWith(
                                  color: AppColors.blue
                              ),),

                            ],
                          ),
                          SizedBox(height: 12.h,),
                          Row(
                            children: [
                              Image.asset("assets/images/home.png",
                                fit: BoxFit.fill,height: 30.h,),

                              Text(" Home",style: Styles.style18,),


                            ],
                          ),
                          SizedBox(height: 12.h,),
                          Text("10th of ramadan City",style: Styles.style12.copyWith(
                              color: AppColors.lightgrey
                          ),),
                          SizedBox(height: 19.h,),
                          Text("Items",style: Styles.style18,),

                        ],
                      ),
                    ),
                    Divider(
                        thickness: 6,color: Color(0xFFF0F1F5)
                    ),
                    ListView.separated(
                        shrinkWrap: true,physics:
                    NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                      return  Container(margin: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Image.network(
                              context.read<CartCubit>().carts[index].image!,
                              width: 93.52,
                              height: 100.h,
                              fit: BoxFit.fill,),
                            SizedBox(width: 16.w,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  //thiss is the proble ,chat gpt
                                  child: Text(context.read<CartCubit>().carts[index].
                                  title!,maxLines: 4,
                                    overflow: TextOverflow.ellipsis,



                                    style: Styles.style14w500.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                ),
                                SizedBox(height: 5.0,),
                                Text(context.read<CartCubit>().carts[index].price!.toString(),
                                  style: Styles.style16blue.copyWith
                                    (fontWeight: FontWeight.bold),),
                                SizedBox(height: 5.0,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(

                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 1.w,color:
                                                AppColors.lightgrey)
                                            ),
                                            child: Center(child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Icon(CupertinoIcons.minus,
                                                size: 18.sp,
                                                color: AppColors.black,),
                                            )),
                                          ),
                                          onTap: (){
                                            context.read<CartCubit>().decreaseQuantity(index);
                                          },
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Text("${context.read<CartCubit>().
                                          carts[index].quantity ??1}",
                                              style: Styles.style16),
                                        ),
                                        GestureDetector(

                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 1.w,color:
                                                AppColors.lightgrey)
                                            ),
                                            child: Center(child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Icon(CupertinoIcons.add,
                                                size: 18.sp,
                                                color: AppColors.black,),
                                            )),
                                          ),
                                          onTap: (){
                                            context.read<CartCubit>().increaseQuantity(index);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 50.0,),
                                    InkWell(

                                      child: CircleAvatar(radius: 24.r,
                                        backgroundColor: Color(0xFFF3F6FB),
                                        child: Icon(Icons.delete_forever_outlined,color: AppColors.red,),
                                      ),
                                      onTap: (){
                                        context.read<CartCubit>().
                                        deleteCart(context.read<CartCubit>().carts[index].id!,
                                            index);
                                      },
                                    ),

                                    SizedBox(width: 50.0,),
                                    Text("  x${context.read<CartCubit>().carts[index].quantity}  ",
                                        style: Styles.style16.copyWith(color: Colors.black)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                        separatorBuilder: (context,index){
                      return SizedBox(height: 12.h,);
                        },
                        itemCount: context.read<CartCubit>().carts.length),
                  //  Text("\$${context.read<CartCubit>().totalPrice}",style: Styles.style18,),
                    Divider(
                        thickness: 6,color: Color(0xFFF0F1F5)
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("   Shipping",style: Styles.style18,),
                        SizedBox(height: 16.h,),
                        Container(
                          margin: EdgeInsets.symmetric
                            (horizontal: 20.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 20.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w,color: AppColors.midgrey
                              )
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/jkt.png",fit: BoxFit.scaleDown,),
                                  SizedBox(width: 16.w,),
                                Text("J&T Express",style: Styles.style14.copyWith(
                                    color: Colors.black
                                ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,size: 16.sp,)
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Divider(thickness: 1,
                                color: AppColors.lightgrey,
                                height: 12,),
                              SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Regular (\$8)",style: Styles.style14.copyWith(
                                          color: Colors.black
                                      ),),
                                      SizedBox(height: 5.h,),
                                      Text("Estimate time 01 - 03 November",
                                        textAlign: TextAlign.start,style: Styles.style14,),

                                    ],
                                  ),
                                ],
                              )

                            ],
                          ),

                        ),

                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Divider(
                      height: 20.h,
                        thickness: 6,color: Color(0xFFF0F1F5)
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Summary",style: Styles.style18,),
                          SizedBox(height: 16.h,),
                                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Delivery Fee",style: Styles.style14.
                         copyWith(
                           color: Color(0xff7C7D82)
                         ),),
                         Text("\$ 10",style: Styles.style20.copyWith(
                           fontWeight: FontWeight.bold,color: Colors.black
                         ),)
                       ],
                                         ),
                          SizedBox(height: 16.h,),
                          Divider(
                            thickness: 2,color: AppColors.lightgrey,
                          )
                      , SizedBox(height: 16.h,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Payment",style: Styles.style14.
                              copyWith(
                                  color: Color(0xff7C7D82)
                              ),),
                              Text("\$ ${context.read<CartCubit>().totalPrice.toInt()}",style: Styles.style20.copyWith(
                                  fontWeight: FontWeight.bold,color: Colors.black
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h,),
                    Divider(
                        height: 20.h,
                        thickness: 6,color: Color(0xFFF0F1F5)
                    ),
                    SizedBox(height: 16.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Method",style: Styles.style18,),
                          SizedBox(height: 16.h,),
                          Container(
                          //  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w,color: AppColors.midgrey
                                )
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/mastercard.png",
                                  fit: BoxFit.fill,height: 30.h,),
                                SizedBox(width: 16.w,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("MasterCard",style: Styles.style14.copyWith(
                                        color: Colors.black
                                    ),),
                                    SizedBox(height: 5.h,),
                                    Text("**** **** 0783 7873",style: Styles.style14,),

                                  ],
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,size: 16.sp,)
                              ],
                            ),

                          ),
                          SizedBox(height: 20.h,),
                          CustomBtn(onPressed: (){
                            showModalBottomSheet(context: context, builder: (context)=>
                                AddPaymentSheet());
                          }, txt: "Pay \$180")
                      ,    SizedBox(height: 20.h,),
                        ],
                      ),
                    ),

                  ],
                ),
              )


          );
        },
      ),
    );
  }
}
