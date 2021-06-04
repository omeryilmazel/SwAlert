import 'package:flutter/material.dart';
import 'package:sw_alert/src/enums/alert_type.dart';
import 'package:sw_alert/src/styles/alert_style.dart';


class SwAlertWidget extends StatelessWidget {
  final AlertType type;
  final String title;
  final Widget content;

  const SwAlertWidget({Key? key,required this.type,required this.title,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFFFFFFF)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFFF2F2F2),
              width: double.maxFinite,
              child: Center(child: Text(title,style: AlertStyle.title)),
            ),
            Image.asset('assets/success.png'),
            Container(
              color: Colors.red,
              height: 85,
              width: double.maxFinite,
              child: Center(child: Text(title,style: AlertStyle.title)),
            )
          ],
        ),
      ),
    );
  }
}
