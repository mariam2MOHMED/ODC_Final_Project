import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/payment/data/models/amount_model.dart';
import 'package:odcorange/features/payment/data/models/item_model.dart';

class AddNewCard extends StatefulWidget {
   AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
String cardNumber="",expiryDate="",cardHolderName="",
    cvvCode="";

bool showBackView=false;

var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      body: Column(
        children: [
      Stack(
        clipBehavior: Clip.none,
alignment: Alignment.bottomCenter,
        children: [
          ClipPath(
        clipper: CustomCurvedEdges(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.3,


        decoration: BoxDecoration(
        //  shape: BoxShape.rectangle,

        color: AppColors.primary,
         // borderRadius: BorderRadius.only(
         //   bottomLeft: Radius.circular(30.r),
         //   bottomRight: Radius.circular(30.r)
         // ),

         // gradient: LinearGradient(
         //     begin: Alignment.topLeft,
         //     end: Alignment.bottomRight,
         //     colors: [
         //   Color(0xff4C5869),
         //       Color(0xff4C5869),
         //       Color(0xff4C5869),
         //       Color(0xff4C5869),
         //
         //   //Color(0xffF898DE).withOpacity(0.4)
         // ])
        ),
        child:  Column(
          children: [
            SizedBox(height: 30.h,),
            Row(
              children: [
                 SizedBox(width: 20.w,),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.midgrey,
                          width: 1.w
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_sharp,
                      color: Colors.white,),
                  ),
                ),
                SizedBox(width: 60.w,),
                Text("Add New Card",style: Styles.style18.copyWith(
                    color: Colors.white
                ),)
              ],
            ),
          ],
        )

        ),
      )
       ,
        Positioned(top:
        MediaQuery.of(context).size.height * 0.1, // تعديله حسب الحاجة
        left: 2.w,
          right: 2.w,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0),
            child: CreditCardWidget(
                      backgroundImage:"assets/images/payment.png",
              cardNumber: cardNumber,
              padding:20.0,

              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              isHolderNameVisible: true,
              cvvCode: cvvCode,
              showBackView: showBackView, //true when you want to show cvv(back) view
              onCreditCardWidgetChange:
                  (CreditCardBrand brand) {}, // Callback for anytime credit card brand is changed
            ),
          ),
        ),


        ],
      ),
          SizedBox(height: 30.h,),

          CreditCardForm(
cvvValidationMessage: " cvv must be not empty",
              cardNumberValidator: (value){
  if(value!.isEmpty||value==null){
    return " cardNumber must be not empty";
  }
              },
              cardHolderValidator:  (value){
                if(value!.isEmpty||value==null){
                  return " cardHolder must be not empty";
                }
              },
              expiryDateValidator:  (value){
                if(value!.isEmpty||value==null){
                  return " expiryDate must be not empty";
                }
              },

              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (credit){
                cardHolderName=credit.cardHolderName;
                cardNumber=credit.cardNumber;
                cvvCode=credit.cvvCode;
                 expiryDate=credit.expiryDate;
                showBackView=credit.isCvvFocused;
                   setState(() {

                  });
              },
              formKey: formKey),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(
              left: 20.0,right: 20.0,
              bottom: 30.0
            ),
            child: CustomBtn(onPressed: (){
              var amount=Amount(total: "100",
                  currency: "USD",
                  details: Details(
                    shippingDiscount: 0,
                    shipping: "0",subtotal: "100"
                  ));
              List<Items>orders=[
                Items(
                  currency: "USD",name:"Apple" ,price:"4" ,quantity: 10
                ),
                Items(
                    currency: "USD",name:"Apple" ,price:"5" ,quantity: 12
                )
              ];
              var itemsList=ItemModel(items: orders);
              if(formKey.currentState!.validate()){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: "AbvhADbYLdhgtuja2tJcTAIBUbr8BHDGi-U8vJIZB5DPgaukbNTEy6FG1Cd500XUToAFPsFjc1t2cahG",
                    secretKey: "EKcylo9uSsLRaNd6V3uYxJGyVlGhLy8hOxftNWdlJEK1dGJzAQNrz9TqgmzkjUnr4_9Ox6sv3f1rCvCj",
                    transactions:  [
                      {
                        "amount": amount.toJson(),
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        "item_list":itemsList.toJson()
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                    },
                  ),
                ));
              }

            }, txt: "Add Payment"),
          )


        ],
      ),
      ),
    );
  }
}


class CustomCurvedEdges extends CustomClipper<Path> {
@override
Path getClip(Size size) {
  final path = Path();
  path.lineTo(0, size.height);

  final firstCurve = Offset(0, size.height - 20);
  final lastCurve = Offset(30, size.height - 20);
  path.quadraticBezierTo(
      firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);
  final secondFirstCurve = Offset(0, size.height - 20);
  final secondLastCurve = Offset(size.width - 30, size.height - 20);
  path.quadraticBezierTo(
      secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);
  final thirdFirstCurve = Offset(size.width, size.height - 20);
  final thirdLastCurve = Offset(size.width, size.height);
  path.quadraticBezierTo(
      thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

  path.lineTo(size.width, 0);
  path.close();
  return path;
}

@override
bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

