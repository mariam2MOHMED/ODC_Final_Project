import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';


class FilterBottomSheet extends StatefulWidget {
  FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double initial = 160.0;
  final double min = 160.0;
  final double max = 1960.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Align(
            alignment: AlignmentDirectional.center,
            child: Container(
              width: 66.67,
              height: 4,
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Filter", style: Styles.style18),
              Text(
                "Reset",
                style: Styles.style14.copyWith(color: AppColors.blue),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(thickness: 1, height: 24, color: AppColors.midgrey),
          SizedBox(height: 12.h),
          Text("Price Range", style: Styles.style18),
          SizedBox(height: 20.h),
          Slider(
            activeColor: Color(0xFFFF9C44),
            inactiveColor: Color(0xFFF1F1F1),
            min: min,
            value: initial,
            max: max,
            onChanged: (value) {
              setState(() {
                initial = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("\$ $min", style: Styles.style12.copyWith(
                color: Colors.black
              )),
              Text("\$ ${initial.toInt()}", style: Styles.style12.copyWith(
                  color: Colors.black
              )),
            ],
          ),
          SizedBox(height: 20.h),
          CustomBtn(onPressed: () {}, txt: "Apply Filter"),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
