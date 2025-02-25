import 'package:flutter/material.dart';

class ColorModel{
  bool isSelected;Color color;

  ColorModel({ this.isSelected=false,required this.color,});
  static List<ColorModel>colors=[
    ColorModel(color:  Color(0xFFA6A5AA)),
    ColorModel(color: Color(0xFFE8E8EA)),
    ColorModel(color:  Color(0xFFF2E0CC)),
  ];
}