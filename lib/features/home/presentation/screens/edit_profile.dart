import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:odcorange/features/auth/presentation/view/widgets/label_text_input.dart';

class EditProfile extends StatefulWidget {
   EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
var usercontroller=TextEditingController();

   var emailcontroller=TextEditingController();
var phonecontroller=TextEditingController();
   DateTime dateTime=DateTime.now();

   String selectedGender="Male";
   var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthCubit(),
  child: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(centerTitle: true,
        title: Text("Edit Profile"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.w),
        child: Form(key: formkey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: AlignmentDirectional.center,
                child: Stack(
                  fit: StackFit.passthrough,
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage:
                      AssetImage(
                          "assets/images/person.png"),
                    ),
                    Container( clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
        ),

                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5,
                        horizontal: 14
                        ),
                        child: Text("Edit",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              LabelTxtInput(label: "Fullname",
                  hint: "Fullname",
                  controller: usercontroller,
                  validator: (value){
          if(value!.isEmpty ||value==null){
            return "userName must be not empty";
          }else{
            return null;
          }
                  }),
              SizedBox(height: 10.h,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date of birth",style: Styles.style12,),
                  SizedBox(height: 12.h,),
                  TextFormField(

                   // controller: widget.controller,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: (){
                          showDatePicker(context: context,
                              firstDate: DateTime.now().subtract(Duration(
                                days: 30
                              )),
                              currentDate: dateTime,
                              lastDate: DateTime.now().add(Duration(days: 30)));
                        },
                            icon: Icon(Icons.date_range)),


                        enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.midgrey,
                              width: 1.w
                              ,)
                        ) ,
                        hintText: "Date of Birth",hintStyle: Styles.style16,
                        border:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.midgrey,width: 1.w
                              ,)
                        )
                    ),

             ),

                ],
              ),
              SizedBox(height: 10.h,),
              LabelTxtInput(label: "Email Address",
                hint: "Email Address",
                  controller: emailcontroller,
                   validator: (value){
                if(value!.isEmpty ||value==null){
                return "userName must be not empty";
                }else{
                return null;
                }
                } ,),
              SizedBox(height: 10.h,),
              Text("PhoneNumber",style: Styles.style12,),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Expanded(flex: 1,
                    child: CountryPickerDropdown(
                      initialValue: 'AR',
                      itemBuilder: _buildDropdownItem,
                      itemFilter: (c) => ['AR', 'EG', 'GB', 'CN'].contains(c.isoCode),
                      priorityList:[
                        CountryPickerUtils.getCountryByIsoCode('GB'),
                        CountryPickerUtils.getCountryByIsoCode('CN'),
                      ],
                      sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                      onValuePicked: (Country country) {
                        print("${country.name}");
                      },
                    ),
                  ),
                  Expanded(flex: 2,
                    child: TextFormField(

                      controller: phonecontroller,
                      decoration: InputDecoration(
                       enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.midgrey,
                                width: 1.w
                                ,)
                          ) ,
                          hintText: "Phone",hintStyle: Styles.style16,
                          border:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.midgrey,width: 1.w
                                ,)
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty ||value==null){
                          return "phone must be not empty";
                        }else{
                          return null;
                        }
                      } ,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.h,),
              Text("Gender",style: Styles.style12,),
              SizedBox(height: 5.h,),
          DropdownButtonFormField<String>(
            value: selectedGender,
            decoration: InputDecoration(

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            items: ["Male", "Female"].map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue!;
              });
            },
          ),
              SizedBox(height: 10.h,),
              CustomBtn(onPressed: (){
                if(formkey.currentState!.validate()){
context.read<AuthCubit>().addUser(emailcontroller.text,
    usercontroller.text,phonecontroller.text);
                }
              }, txt: "Save")
            ],
          ),
        ),
      ),
    );
  },
),
);
  }
}
Widget _buildDropdownItem(Country country) => Container(
  child: Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(
        width: 8.0,
      ),
      Text("+${country.phoneCode}(${country.isoCode})"),
    ],
  ),
);
