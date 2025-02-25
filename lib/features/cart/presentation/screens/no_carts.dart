import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/styles.dart';

class NoCarts extends StatelessWidget {
  String txt;String desc;
   NoCarts({required this.txt,
     required this.desc,
   });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/cart.png",height: 
          MediaQuery.of(context).size.height*0.25,),
          SizedBox(height: 20.h,),
          Text(txt,textAlign: TextAlign.center,style: Styles.style24,)
         , SizedBox(height: 16.h,),
          Text("Looks like you haven't added anything\n to your ${desc} yet",textAlign: TextAlign.center,style: Styles.style14grey,)
        ],
      ),
    );
  }
}
