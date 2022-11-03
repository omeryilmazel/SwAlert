import 'package:flutter/material.dart';
import 'package:sw_alert/src/styles/colors.dart';

class AlertTextStyle{
  static var title = TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold);
  static var content = TextStyle(color: Color(0xA3FFFFFF),fontSize: 14);
  static var buttonText = TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14);
  static var contentTitle = TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold,fontSize: 16);
  static var skipText = TextStyle(color: SwColors.mainColor,fontWeight: FontWeight.w700);
}
