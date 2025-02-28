import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';
import 'package:odcorange/features/auth/presentation/view/widgets/label_text_input.dart';
import 'package:odcorange/features/home/presentation/screens/home_page.dart';

import '../../../../../core/constants/App_Colors.dart';
import '../../../logic/auth_cubit/auth_cubit.dart';
import '../widgets/forget_password_sheet.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child:
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
          if (state is AuthLoginSuccess) {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Success Login"),
                ));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                    HomePage()));
              }
            if (state is AuthLoginFailure) {
               // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
        
              }
            },
            builder: (context, state) {
              return ConditionalBuilder(condition: state is !AuthLoginLoading,
                  builder: (context)=>   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        Text(
                            "Login to your \naccount.",
                            style:Styles.style32
                        ),
                        SizedBox(height: 24),
                        LabelTxtInput(
                          hint: 'UserName',
                          label: 'UserName',
                          controller: userNameController,
                          validator: (value ) {
                            if(value!.isEmpty||value==null){
                              return "UserName ust be not empty";
                            }else{
                              return null;
                            }
        
                          },
                        ),
                        SizedBox(height: 24),
                        LabelTxtInput(
                          hint: 'Enter Your Password',
                          label: 'Password',
                          controller: passwordController,
                          isPassword: true, validator: (value ) {
                          if(value!.isEmpty||value==null){
                            return "Password ust be not empty";
                          }else{
                            return null;
                          }
        
                        },
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context, 
                                builder: (context)=>ForgetPasswordSheet());
                          },
                          child: Align(alignment: AlignmentDirectional.center,
                            child: Text(
                                "Forget Password?",
                                style:Styles.style16black
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        CustomBtn(
                            txt: 'Login',
                            onPressed: () {
                              context.read<AuthCubit>().login(
                                  userNameController.text, passwordController.text);
        
                            }),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text("Don't Have an Account ",style: Styles.style16grey),
                            TextButton(onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context)=>RegisterScreen()));
                            }, child: Text("Register ",style:Styles.style16blue,),)
                          ],
                        )
                      ],
                    ),
                  ),
                  fallback: (context)=>Center(child:
                  LoadingAnimationWidget.threeArchedCircle(color: AppColors.primary,
                      size: 40.sp)));
        
            },
          ),
        ),
      ),
    );
  }
}
