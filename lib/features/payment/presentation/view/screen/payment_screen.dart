import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/payment/presentation/view/widgets/add_payment_sheet.dart';
import 'package:odcorange/features/payment/presentation/view/widgets/payment_method.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaymentMethod(title: "MasterCard", image: "assets/images/mastercard.png",
                subtitle: "**** **** 0783 7873"),
            PaymentMethod(title: "Paypal", image: "assets/images/paypal.png",
                subtitle: "**** **** 0582 4672"),
            PaymentMethod(title: "Apple Pay", image: "assets/images/apple-pay.png",
                subtitle: "**** **** 0582 4672"),

        Padding(
          padding:  EdgeInsets.only(top: 130.h,
            left: 20.0,right: 20.0
          ),
          child: CustomBtn(onPressed: (){
            showModalBottomSheet(context: context,
                builder: (context)=>AddPaymentSheet());
          }, txt: "Add New Payment"),
        )
          ],
        ),
      ),
    );
  }
}
