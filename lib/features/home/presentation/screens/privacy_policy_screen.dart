import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/styles.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("Privacy policy"),
      ) ,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              SizedBox(height: 20.h,),
              Text("1. Types of Data We Collect",style: Styles.style18,)
          ,SizedBox(height: 12.h,)
              ,  Text('''It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                style: Styles.style14grey.copyWith(
                  color: Color(0xFF7C7D81),
                  fontWeight: FontWeight.w400,
                ),),
              SizedBox(height: 24.h,),
              Text("2. Use of Your Personal Data",style: Styles.style18,)
              ,SizedBox(height: 12.h,)
              ,  Text('''Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
          
The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.''',
                style: Styles.style14grey.copyWith(
                    color: Color(0xFF7C7D81),
                  fontWeight: FontWeight.w400,
                ),),
              SizedBox(height: 24.h,),
              Text("3. Disclosure of Your Personal Data",style: Styles.style18,)
              ,SizedBox(height: 12.h,)
              ,  Text(''' Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.''',
                style: Styles.style14grey.copyWith(
                    color: Color(0xFF7C7D82),
                  fontWeight: FontWeight.w400,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
