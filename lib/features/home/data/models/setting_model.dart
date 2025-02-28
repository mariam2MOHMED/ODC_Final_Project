

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/features/address/presentation/screens/select_address.dart';

class SettingModel{
  Widget prefix;String title;Widget suffix;

  void Function()?on;
  SettingModel({
    required this.prefix,
    required this.title,required this.suffix,
this.on
});


}