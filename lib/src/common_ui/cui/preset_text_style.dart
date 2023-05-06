import 'package:flutter/material.dart';

class PresetTextStyle {
  static const text56B = TextStyle(fontSize: 56, fontWeight: FontWeight.w700);
  static const text56M = TextStyle(fontSize: 56, fontWeight: FontWeight.w500);
  static const text56R = TextStyle(fontSize: 56);
  static const text46B = TextStyle(fontSize: 46, fontWeight: FontWeight.w700);
  static const text46M = TextStyle(fontSize: 46, fontWeight: FontWeight.w500);
  static const text46R = TextStyle(fontSize: 46);
  static const text40B = TextStyle(fontSize: 40, fontWeight: FontWeight.w700);
  static const text38B = TextStyle(fontSize: 38, fontWeight: FontWeight.w700);
  static const text38M = TextStyle(fontSize: 38, fontWeight: FontWeight.w500);
  static const text38R = TextStyle(fontSize: 38);
  static const text30B = TextStyle(fontSize: 30, fontWeight: FontWeight.w700);
  static const text30M = TextStyle(fontSize: 30, fontWeight: FontWeight.w500);
  static const text30R = TextStyle(fontSize: 30);
  static const text28B = TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
  static const text28M = TextStyle(fontSize: 28, fontWeight: FontWeight.w500);
  static const text28R = TextStyle(fontSize: 28);
  static const text24B = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  static const text24M = TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
  static const text24R = TextStyle(fontSize: 24);
  static const text20B = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  static const text20M = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const text20R = TextStyle(fontSize: 20);
  static const text18B = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const text18M = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const text18R = TextStyle(fontSize: 18);
  static const text16B = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  static const text16M = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const text16R = TextStyle(fontSize: 16);
  static const text14B = TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
  static const text14M = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static const text14R = TextStyle(fontSize: 14);
  static const text13B = TextStyle(fontSize: 13, fontWeight: FontWeight.w700);
  static const text13M = TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
  static const text13R = TextStyle(fontSize: 13);
  static const text12B = TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
  static const text12M = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static const text12R = TextStyle(fontSize: 12);
  static const text10B = TextStyle(fontSize: 10, fontWeight: FontWeight.w700);
  static const text10M = TextStyle(fontSize: 10, fontWeight: FontWeight.w500);
  static const text10R = TextStyle(fontSize: 10);
}

extension TextStyleExt on TextStyle {
  TextStyle withColor(Color? color) => copyWith(color: color);

  TextStyle withFontFamily(String fontFamily) => copyWith(fontFamily: fontFamily);
}
