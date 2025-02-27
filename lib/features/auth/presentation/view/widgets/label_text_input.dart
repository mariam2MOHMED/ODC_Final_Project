import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';

class LabelTxtInput extends StatefulWidget {
  String label;TextEditingController controller;bool isPassword;
  String hint;String? Function(String?)? validator;
   LabelTxtInput({  this.isPassword=false,
    required this.label, required this.hint, required this.controller,
required this.validator});

  @override
  State<LabelTxtInput> createState() => _LabelTxtInputState();
}

class _LabelTxtInputState extends State<LabelTxtInput> {
  bool Obsecure=false;
  @override
  Widget build(BuildContext context) {

    return
      Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Text(widget.label,style: Styles.style12.copyWith(
  color: Color(0xFF7C7D81)
),),
        SizedBox(height: 12.h,),
        TextFormField(
          obscureText:Obsecure ,
          controller: widget.controller,
          decoration: InputDecoration(
suffixIcon: widget.isPassword==true?
IconButton(onPressed: (){
  Obsecure=!Obsecure;
  setState(() {
    
  });
},
    icon: Icon(Obsecure==false?CupertinoIcons.eye:
    Icons.visibility_off_outlined,color: AppColors.primary,)):null,
            enabledBorder:OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.midgrey,
                  width: 1.w
                  ,)
            ) ,
            hintText: widget.hint,hintStyle:
          Styles.style16.copyWith(
    color: Color(0xFF7C7D81)
    ),
            border:OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.midgrey,width: 1.w
              ,)
            )
         ),
        validator: widget.validator,
        )
      ],
    );
  }
}
