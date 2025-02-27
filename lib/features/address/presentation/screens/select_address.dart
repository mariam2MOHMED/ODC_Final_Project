import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/address/presentation/screens/new_address.dart';
import 'package:odcorange/features/address/presentation/widget/select_address_widget.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select Address",style: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,fontFamily: GoogleFonts.plusJakartaSans().fontFamily
        ),),
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.midgrey,
                      width: 1.w)),
              child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(Icons.add)),
            ),
          ),
          SizedBox(width: 10.w,)
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          children: [
            SelectAddressWidget(image: "assets/images/home.png", title: "Home")
         ,SizedBox(height:20.h ,),
            SelectAddressWidget(
                isOrange: true,
                image: "assets/images/office.png", title: "Office")
            ,SizedBox(height:20.h ,),
            SelectAddressWidget(image: "assets/images/appartment.png", title: "appartment")
        ,Spacer(),
            CustomBtn(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>NewAddress()));
            }, txt: "Select Address")
          ]
        ),
      ),
    );
  }
}
