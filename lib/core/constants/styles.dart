import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odcorange/core/constants/App_Colors.dart';

abstract class Styles{
  static TextStyle style32=TextStyle(
      color:AppColors.black,fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style28=TextStyle(
    color:AppColors.black,fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style14=TextStyle(
      color:AppColors.darkgrey,fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style18=TextStyle(
      color:AppColors.black,fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );

  static TextStyle style14white=TextStyle(
      color:Colors.white,fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style12White=TextStyle(
      color:Colors.white,fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style14w500=TextStyle(
      color:AppColors.black,fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style12=TextStyle(
      color:AppColors.darkgrey,fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style16=TextStyle(
      color:AppColors.lightgrey,fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style16black=TextStyle(
      color:AppColors.black,fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );

  static TextStyle style14grey=TextStyle(
      color: Color(0xFF7C7D81),fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style20=TextStyle(
      color: AppColors.blue,fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style24=TextStyle(
      color:AppColors.black,fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style16grey=TextStyle(
      color:AppColors.darkgrey,fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style16blue=TextStyle(
      color:AppColors.blue,fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
  static TextStyle style16white=TextStyle(
      color:Colors.white,fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily
  );
}