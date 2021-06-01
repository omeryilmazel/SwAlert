import 'package:flutter/material.dart';
import 'package:sw_alert/src/styles/alert_style.dart';

enum AlertType{SUCCES,ERROR,WARNING}

class SwAlert extends StatelessWidget {
  final AlertType alertType;
  final String title;
  final Widget content;

  const SwAlert({Key? key,required this.alertType,required this.title,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            color: Color(0xFFF2F2F2),
            height: 85,
            child: Center(child: Text(title,style: AlertStyle.title)),
          )
        ],
      ),
    );
  }
}
