import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/home/data/models/setting_model.dart';

class SettingWidget extends StatelessWidget {
  SettingModel settingModel;
  SettingWidget({
    required this.settingModel
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
          settingModel.prefix,SizedBox(width: 16.w,),
              Text( settingModel.title,style: Styles.style16black,),
              Spacer(),
              settingModel.suffix


            ],
          ),
          Divider(thickness: 1,color: Color(0xffEAEAEA),)
        ],
      ),
    );
  }
}
